// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Output the number 65
// RUN --> ./output1 ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X0, #65
	mov	X16, #1
	svc	#0x80