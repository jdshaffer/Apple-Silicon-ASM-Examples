// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Logical Shift Right (LSR)
// Each shift left = number / 2
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X1, 15					// 15 in binary is 1111
	lsr	X0, X1, 1				// Shift X1 right by 1 and store in X0
								// Answer should be 15 / 2 = 7
								// (Remainders are discarded)

end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
@ Shift bits right, which means divide by two


.global _start
_start:
  MOV R1, #15           @ 15 = 1111
  MOV R0, R1, LSR #1    @ Take R1, Shift Right by 1, store in R0
                        @ LSR = Logical Shift Right

end:
  MOV R7, #1
  SWI 0
