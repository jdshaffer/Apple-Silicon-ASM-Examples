// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Logical Operators -- and, orr, eor, bic
// Uncomment the operator you wish to use
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	mov	X1,  5					// Represents binary number      0101 =  5
	mov	X2,  9					// Represents binary number      1001 =  9

	and	X0, X1, X2				// Outputs X1 AND X2  =          0001 =  1
//	orr	X0, X1, X2				// Outputs X1  OR X2  =          1110 = 13
//	eor	X0, X1, X2				// Outputs X1 Exclusive OR X2  = 1100 = 12
//	bic	X0, X1, X2				// Bit Clear -- Returns 0 unless top bit is 1 and bottom is 0 = 0100 = 4


end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action
