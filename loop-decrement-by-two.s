// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Loops -- Decrement by 2s
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X0, 50					// Store #50 into X0
	mov	X1, 2					// Store  #2 into X1
	bl _loop					// Branch to "_loop"


_decrement:
	SUB	X0, X0, X1				// Subtract 2 (X1) from X0 and store in X0


_loop:
	cmp	X0, X1					// Compare X0 and X1
	b.ne	_decrement			// Branch to "_decrement" if not equal


end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
