// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// MADD -- Multiply Add
// AKA "MLA -- Multiply Accumulate" in Raspberry Pi ARM
// Multiplies two register values, and adds a third register value
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X1, 7					// Store 7 in X1
	mov	X2, 2					// Store 2 in X2
	mov	X3, 6					// Store 3 in X3
	MADD X0, X1, X2, X3			// X0 = (X1 * X2) + X3


end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
