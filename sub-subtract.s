// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Subtract two values
// RUN --> ./subtract ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X0, #20
	sub	X0, X0, #7
	mov	X16, #1
	svc	#0x80