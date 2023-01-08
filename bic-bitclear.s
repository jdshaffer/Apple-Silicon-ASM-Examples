// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Bit Clear
//  a : 0110 0001
//    : 0010 0000  <-- Use bit-clear with value 32 to change a to A 
//  A : 0100 0001
// ------------------------------------------------


.global _start
.align 2


_start:
								// READ IN A LEETER FROM THE KEYBOARD
	mov	X16, 3					// Tell system we want to read from StdIn (#3)
	mov	X0, 0					// Focus on the keyboard (#0)
	mov	X2, 2					// Define length of string to read in (char + \n)

	adrp	x1, char@page		// Load the address of the character
	add	x1, x1, char@pageoff	// Store the address in x1
	svc	0						// Call kernel to perform the action


_shift_to_uppercase:
	adrp	x1, char@page		// Load the address of the character
	add	x1, x1, char@pageoff	// Store the address to x1

	ldr	x0, [x1]				// Load x1 contents to x0 for use
	bic	x0, x0, 32				// Use Bit Clear on x0 and store in x0
	str	x0, [x1]				// Store x0 contents back to address x1


_write:
	mov	X16, 4					// Tell system we want to write to StdOut (#4)
	mov	X0, 1					// Focus on the screen (#1)

	adrp	x1, char@page		// Load the address of the character
	add	x1, x1, char@pageoff	// Store the address to x1
	svc	0						// Call kernel to perform the action



_end:
	mov	X0, 0					// Return 0 (get a run error without this)
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action




.data
char:
	.ds 2						// 2 bytes of memory for keyboard input
								//   (input + \n)


