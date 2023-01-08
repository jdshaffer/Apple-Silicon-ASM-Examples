// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Read in from keyboard and print to the screen
// ------------------------------------------------


.global _start
.align 2


_start:
								// READ IN FROM KEYBOARD
	mov	X16, 3					// Tell system we want to read from StdIn (#3)
	mov	X0, 0					// Focus on the keyboard (#0)
	mov	X2, 20					// Define length of string to read in

	adrp	x1, msg@page		// Load the address of the message
	add	x1, x1, msg@pageoff		// Store the address to x1

	svc	0						// Call kernel to perform the action



_write:
	mov	X16, 4					// Tell system we want to write to StdOut (#4)
	mov	X0, 1					// Focus on the screen (#1)

	adrp	x1, msg@page		// Load the address of the message
	add	x1, x1, msg@pageoff		// Store the address to x1

	svc	0						// Call kernel to perform the action



_end:
	mov	X0, 0					// Return 0 (get a run error without this)
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action



.data
msg:
	.ds 20						// 20 bytes of memory for keyboard input


