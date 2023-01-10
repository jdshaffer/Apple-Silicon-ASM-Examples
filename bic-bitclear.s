// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Bit Clear Example
//  a : 0110 0001
//    : 0010 0000  <-- Use bit-clear with value 32 to change a to A 
//  A : 0100 0001
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
								// READ IN A LEETER FROM THE KEYBOARD
	MOV	X16, 3					// Tell system we want to read from StdIn (#3)
	MOV	X0, 0					// Focus on the keyboard (#0)
	MOV	X2, 2					// Define length of string to read in (char + \n)

	ADRP	x1, char@page		// Load the address of the character
	ADD	x1, x1, char@pageoff	// Store the address in x1
	SVC	0						// Call kernel to perform the action


_shift_to_uppercase:
	ADRP	x1, char@page		// Load the address of the character
	ADD	x1, x1, char@pageoff	// Store the address to x1

	LDR	x0, [x1]				// Load x1 contents to x0 for use
	BIC	x0, x0, 32				// Use Bit Clear on x0 and store in x0
	STR	x0, [x1]				// Store x0 contents back to address x1


_write:
	MOV	X16, 4					// Tell system we want to write to StdOut (#4)
	MOV	X0, 1					// Focus on the screen (#1)

	ADRP	x1, char@page		// Load the address of the character
	ADD	x1, x1, char@pageoff	// Store the address to x1
	SVC	0						// Call kernel to perform the action



_end:
	MOV	X0, 0					// Return 0 (get a run error without this)
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action




.data
char:
	.ds 2						// 2 bytes of memory for keyboard input + \n
