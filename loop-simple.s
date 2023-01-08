// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Simple Loop
// RUN --> ./loop ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start: 
	mov	X0, 0
	mov	X1, 1
	bl	_continue_loop


_loop:
	add	X0, X0, X1				// Add X1 to X0 and store in X0


_continue_loop:
	cmp	X0, 9					// Does X0 = 9?
	ble	_loop					// If <=, the loop


_end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
