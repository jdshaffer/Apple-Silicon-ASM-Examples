// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Loops -- Decrement by 2s
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X0, 50					// Store #50 into X0
	MOV	X1, 2					// Store  #2 into X1
	BL	_loop					// Branch to "_loop"


_decrement:
	SUB	X0, X0, X1				// Subtract 2 (X1) from X0 and store in X0


_loop:
	CMP	X0, X1					// Compare X0 and X1
	B.NE	_decrement			// Branch to "_decrement" if not equal


end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
