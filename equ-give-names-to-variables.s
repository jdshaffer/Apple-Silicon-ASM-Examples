// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Use EQU to give names to variables
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2

.equ	two, 2


_start: 
	mov	X0, #two				// Store #2 into X0 using the EQU name


_end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
