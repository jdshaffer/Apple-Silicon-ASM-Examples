// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Simple Loop
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start: 
	MOV	X0, 0
	MOV	X1, 1
	BL	_continue_loop


_loop:
	ADD	X0, X0, X1				// Add X1 to X0 and store in X0


_continue_loop:
	CMP	X0, 9					// Does X0 = 9?
	B.LE	_loop				// If <=, the loop


_end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
