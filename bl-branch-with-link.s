// ---------------------------------------------------------------------
// New Example Created for Apple Silicon
// 2025-06-15
// Jds
//
// Purpose: "Branch with Link" jumps to a new location in the code,
//           but also provides a return address to the calling function
//
// Note: This example did not exist in the original collection of Apple
//        Silicon example programs as the original Raspberry Pi examples
//        improperly used BL (Branch with Link) as if it were B (Branch).
//
// Thanks to Peter Hall for pointing out the BL / B mixup!
//
// ---------------------------------------------------------------------
// Branching with Link
//
// COMPILE  -->  make main
// RUN      -->  ./filename
// ---------------------------------------------------------------------


.global main
.align 4


main:
    BL    branch_1                    // Branch to branch_1 (with a link to return here to main)
    BL    branch_2                    // Branch to branch_2 (with a link to return here to main)
	B     end                         // Branch to end      (no need to return to here, so no link)


branch_1:
	ADRP  X0, output_1@PAGE           // load the string in output_1 to print
	ADD   X0, X0, output_1@PAGEOFF
	B 	_printf                       // print the loaded message
    RET                               // return to where we left off in "main"


branch_2:
	ADRP  X0, output_2@PAGE           // load the string in output_2 to print
	ADD   X0, X0, output_2@PAGEOFF
	B 	_printf                       // print the loaded message
    RET                               // return to where we left off in "main"


end:
	ADRP  X0, output_3@PAGE           // load the string in output_3 to print
	ADD   X0, X0, output_3@PAGEOFF
	BL 	_printf                       // print the loaded message

	mov   X16, 1                      // System call to terminate this program
	svc   0


.data
output_1:   .asciz "Hello from Branch 1!\n"
output_2:   .asciz "Here's lookin' at you, kid! -- Branch 2\n"
output_3:   .asciz "So long and thanks for all the fish... -- The End\n"
