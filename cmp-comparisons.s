// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Comparisons using CMP
// Uncomment the comparison you wish to try
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
								// X1 < X2 EXAMPLE -- SHOULD RETURN 1
	MOV	X1, 5					// Store  #5 into X1
	MOV	X2, 10					// Store #10 into X2

								// X1 > X2 EXAMPLE -- SHOULD RETURN 2
//	MOV	X1, 15					// Store #15 into X1
//	MOV	X2, 10					// Store #10 into X2

								// X1 = X2 EXAMPLE -- SHOULD RETURN 3
//	MOV	X1, 12					// Store #12 into X1
//	MOV	X2, 12					// Store #12 into X2

	CMP	X1, X2
	B.EQ	vals_equal			// Branch to "vals_equals" if X1 and X2 are equal
	B.GT	x1_gt				// Branch to "x1_gt" is X1 is greater


x1_lt:							// Code falls through to here if not eq or gt
	MOV	X0, 1					// Output 1 if X1 is less than X2
	BL	end


x1_gt:
	MOV	X0, 2					// Output 2 if X1 is greater than X2
	BL	end


vals_equal:
	MOV	X0, 3					// Output 3 if X1 is equal to X2


end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
