// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Storing Data in Memory -- Example 2
//
// (1) Create empty memory (.data) space
// (2) Move data into memory
// (3) Read data from memory and use
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
									// --- MOVE DATA INTO MEMORY ---
	ADRP	X10, fifteen@PAGE		// load address of "fifteen" data into X10
	ADD	X10, X10, fifteen@PAGEOFF
	MOV	X3, 15						// Store 15 into X3
	STR	X3, [X10]					// Store value of X3 into address at X10

	ADRP	X11, thirty@PAGE		// load address of "fifteen" data into X11
	ADD	X11, X11, thirty@PAGEOFF
	MOV	X3, 30						// Store 30 into X3
	STR	X3, [X11]					// Store value of X3 into address at X11


									// --- READ DATA FROM MEMORY ---
	ADRP	X10, fifteen@PAGE		// load address of "fifteen" data into X10
	ADD	X10, X10, fifteen@PAGEOFF
	LDR	X1, [X10]					// Load value at address [X10] into X1

	ADRP	X11, thirty@PAGE		// load address of "fifteen" data into X11
	ADD	X11, X11, thirty@PAGEOFF
	LDR	X2, [X11]					// Load value at address [X11] into X2

									//---  USE THE DATA TO DO SOMETHING ---
	ADD	X0, X1, X2					// Add X1 and X1 and store in X0


_end:
	MOV	X16, #1
	SVC	0


.data
.balign 4					// Request 4 bytes for our data
fifteen:					// Give a label for the data
  .word 0					// Assign a value of 0 to the label

.balign 4					// Request 4 bytes for our data
thirty:						// Give a label for the data
  .word 0					// Assign a value of 0 to the label