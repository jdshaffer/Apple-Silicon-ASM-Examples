# This makefile, as is, expects an input file named:   temp.s
# And expext the body of the program to be named:  _start
# Be sure to update the input file name and body name, if needed.
# 2023-01-09
# Jds


temp: temp.o
	ld -o temp temp.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

temp.o: temp.s
	as -arch arm64 -o temp.o temp.s

clean:
	rm temp
	rm temp.o

run:
	./temp



# This allows up to use a "main" function for calls to printf and scanf
main:
	as -arch arm64 -o temp.o temp.s
	ld -o temp temp.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e main -arch arm64 