// ------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------------
// Introduction to the Stack 2 (STP and LDP)
//
// (1) Store a PAIR of registers onto the stack
// (2) Change their values.
// (3) Read back the PAIR from the stack. 
//
// NOTE: There does not appear to be a way to simply
//       backup or read all the registers to the stack
//       as in ASM for the Raspberry Pi processor.
//
//       STMFD SP!, {R4-R12}       <-- Doesn't work
//       LDMFD SP!, {R4-R12}       <-- Doesn't Work
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------------


.global _start
.align 2


_start:
	MOV	X4, 1					// Store 1 in x4
	MOV	X5, 2					// Store 2 in x5

	STP	X4, X5, [SP, #-16]!		// Write X4 and X5 to the stack
	MOV	X4, 3					// Overwrite X4's value
	MOV	X5, 4					// Overwrite X5's value
	ADD	X0, X4,  0				// X0 = 3 + 0 = 3
	ADD	X0, X0, X5				// X0 = 3 + 4 = 7

	LDP	X4, X5, [SP], #16		// Read back X4 and X5 from the stack
	ADD	X0, X0, X4				// X0 = 7 + 1 = 8
	ADD	X0, X0, X5				// X0 = 8 + 2 = 10


_end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0
