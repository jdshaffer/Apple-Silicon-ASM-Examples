// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Logical Shift Right (LSR)
// Each shift left = number / 2
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X1, 15					// 15 in binary is 1111
	LSR	X0, X1, 1				// Shift X1 right by 1 and store in X0
								// Answer should be 15 / 2 = 7
								// (Remainders are discarded)

end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
