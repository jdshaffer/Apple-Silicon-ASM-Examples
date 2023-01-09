// ------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-09
// Jds
// ------------------------------------------------------
// Introduction to the Stack 2 (STP and LDP)
//
// Store a PAIR of registers onto the stack
// Change their values.
// Then read back the PAIR from the stack. 
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------------
// NOTE: There does not appear to be a way to simply
//       backup or read all the registers to the stack
//       as in ASM for the Raspberry Pi processor.
//
//       STMFD SP!, {R4-R12}       <-- Doesn't work
//       LDMFD SP!, {R4-R12}       <-- Doesn't Work
// ------------------------------------------------------



.global _start
.align 2


_start:
	mov	X4, 1					// Store 1 in x4
	mov	X5, 2					// Store 2 in x5

	stp	X4, X5, [SP, #-16]!		// Write X4 and X5 to the stack
	mov	X4, 3					// Overwrite X4's value
	mov	X5, 4					// Overwrite X5's value
	add	X0, X4,  0				// X0 = 3 + 0 = 3
	add	X0, X0, X5				// X0 = 3 + 4 = 7

	ldp	X4, X5, [SP], #16		// Read back X4 and X5 from the stack
	add	X0, X0, X4				// X0 = 7 + 1 = 8
	add	X0, X0, X5				// X0 = 8 + 2 = 10


_end:
	mov	X16, 1					// System call to terminate this program
	svc	0
