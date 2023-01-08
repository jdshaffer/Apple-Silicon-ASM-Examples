// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Multiply two values
// RUN --> ./multiply ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X1, #2
	mov	X2, #11
	mul	X0, X1, X2

	mov	X16, #1
	svc	#0x80