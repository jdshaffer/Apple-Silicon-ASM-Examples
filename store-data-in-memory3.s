// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Storing Data in Memory -- Example 3
//
// (1) Create data in memory
// (2) Change the value of the data in memory
// (2) Read back the new data from memory
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
	ADRP	X11, info@PAGE			// load address of "info" data into X11
	ADD	X11, X11, info@PAGEOFF

	MOV	X1, 100						// Store 100 into X1
	STR	X1, [X11]					// Store value of X1 into address at X11
	
	LDR	X0, [X11]					// Load data from address at X11 into X0


_end:
	MOV	X16, #1
	SVC	0



.data
.balign 4							// Request 4 bytes for our data
info:								// Give a label for the data
 	.word 10						// Assign a value to the data

