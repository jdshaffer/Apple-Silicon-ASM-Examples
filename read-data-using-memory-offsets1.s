// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------
// Reading Data via Memory Offsets
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 4


_start:
	ADRP	X3, primes@PAGE			// load address of "primes" data into X3
	ADD	X3, X3, primes@PAGEOFF

//	LDR	X0, [X3]					// Loads value in address [X3] into X0		(2)
//	LDR	X0, [X3, #4]				// Loads value in address [X3] + 4 bytes	(3)
//	LDR	X0, [X3, #8]				// Loads value in address [X3] + 8 bytes	(5)
	LDR	X0, [X3, #12]				// Loads value in address [X3] + 12 bytes	(7)


_end:
	MOV	X16, #1
	SVC	0


.data
primes:
	.word 2
	.word 3
	.word 5
	.word 7
