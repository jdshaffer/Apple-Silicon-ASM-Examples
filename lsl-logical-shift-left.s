// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Logical Shift Left (LSL)
// Each shift left = number x 2
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X1, 15					// 15 in binary is 1111
	lsl	X0, X1, 1				// Shift X1 left by 1 and store in X0
								// Answer should be 15 x 2 = 30

end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
