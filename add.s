// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Add two values
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X0, #7
	add	X0, X0, #13
	mov	X16, #1
	svc	0
