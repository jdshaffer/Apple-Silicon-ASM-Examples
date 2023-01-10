// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Subtract two values
//
// COMPILE --> make
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X0, 20					// Move the number 20 into register X0
	SUB	X0, X0, 7				// Subtract 7 from X0 (20) and store in X0 (13)
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
