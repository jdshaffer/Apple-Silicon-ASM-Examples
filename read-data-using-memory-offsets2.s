// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Reading Data via Memory Offsets (using bytes)
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
	ADRP	X3, numbers@PAGE		// load address of "numbers" data into X3
	ADD	X3, X3, numbers@PAGEOFF

//	LDR X0, [X3]					// Loads value at first byte at address [X3] into X0	(1)
//	LDR X0, [X3, #1]				// Loads value at first byte at address [X3] into X0	(2)
//	LDR X0, [X3, #2]				// Loads value at first byte at address [X3] into X0	(3)
//	LDR X0, [X3, #3]				// Loads value at first byte at address [X3] into X0	(4)
	LDR X0, [X3, #4]				// Loads value at first byte at address [X3] into X0	(5)


_end:
	MOV	X16, #1
	SVC	0


.data
numbers:
	.byte 1, 2, 3, 4, 5




