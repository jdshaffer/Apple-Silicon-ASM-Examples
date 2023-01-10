// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Storing Data in Memory -- Example 1
//
// (1) Create data in memory space
// (2) Read data from memory and use
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
	ADRP	X10, fifteen@PAGE			// load address of "fifteen" data into X10
	ADD	X10, X10, fifteen@PAGEOFF
	LDR	X1, [X10]						// Load value at address [X10] into X1

	ADRP	X11, thirty@PAGE			// load address of "fifteen" data into X11
	ADD	X11, X11, thirty@PAGEOFF
	LDR	X2, [X11]						// Load value at address [X11] into X2

	ADD	X0, X1, X2						// Add X1 and X1 and store in X0


_end:
	MOV	X16, #1
	SVC	0



.data
.balign 4								// Request 4 bytes for our data
fifteen:								// Give a label for the data
  .word 15								// Assign a value (15) to the label

.balign 4								// Request 4 bytes for our data
thirty:									// Give a label for the data
  .word 30								// Assign a value (30) to the label