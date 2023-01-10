// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// AND, ORR, EOR, BIC -- Logical Operators
// Uncomment the operator you wish to use
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X1,  5					// Represents binary number      0101 =  5
	MOV	X2,  9					// Represents binary number      1001 =  9

	AND	X0, X1, X2				// Outputs X1 AND X2  =          0001 =  1
//	ORR	X0, X1, X2				// Outputs X1  OR X2  =          1110 = 13
//	EOR	X0, X1, X2				// Outputs X1 Exclusive OR X2  = 1100 = 12
//	BIC	X0, X1, X2				// Bit Clear -- Returns 0 unless top bit is 1 and bottom is 0 = 0100 = 4


end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
