// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Branching
// RUN --> ./branch ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start: 
	mov	X0, 14					// Set X0 to #14
	bl	other					// Branch to "other"
	mov	X0, 11					// (X0 is not set to 11 because of branch)

other:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
