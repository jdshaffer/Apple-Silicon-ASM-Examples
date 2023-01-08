# Be sure to update the filenames!
# Current this makefile expects a file named temp.s


temp: temp.o
	ld -o temp temp.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 


temp.o: temp.s
	as -arch arm64 -o temp.o temp.s


clean:
	rm temp
	rm temp.o
	
run:
	./temp