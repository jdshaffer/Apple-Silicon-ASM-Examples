// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// MUL -- Multiply two values
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X1, #2
	MOV	X2, #11
	MUL	X0, X1, X2

	MOV	X16, #1
	SVC	#0x80