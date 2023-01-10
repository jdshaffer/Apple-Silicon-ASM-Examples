// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Read in from keyboard and print to the screen
//
// NOTE: This example uses system and kernel calls
//       to read from the keyboard and write to
//       the screen. It does not use printf or
//       scanf (which are shown in other examples).
//
// COMPILE  -->  make
// RUN      -->  ./filename
// ------------------------------------------------


.global _start
.align 2


_start:
								// READ IN FROM KEYBOARD
	MOV	X16, 3					// Tell system we want to read from StdIn (#3)
	MOV	X0, 0					// Focus on the keyboard (#0)
	MOV	X2, 20					// Define length of string to read in

	ADRP	x1, msg@page		// Load the address of the message
	ADD	x1, x1, msg@pageoff		// Store the address to x1

	SVC	0						// Call kernel to perform the action


_write:
	MOV	X16, 4					// Tell system we want to write to StdOut (#4)
	MOV	X0, 1					// Focus on the screen (#1)

	ADRP	x1, msg@page		// Load the address of the message
	ADD	x1, x1, msg@pageoff		// Store the address to x1

	SVC	0						// Call kernel to perform the action


_end:
	MOV	X0, 0					// Return 0 (get a run error without this)
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action



.data
msg:
	.ds 20						// 20 bytes of memory for keyboard input


