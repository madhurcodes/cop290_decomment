all:
	flex -o tryreg.c comrem.l
	gcc -o tryreg tryreg.c -lfl
	./tryreg >myout <exinp 2>err
test:
	lex -o tryreg.c comrem.l
	gcc -o tryreg tryreg.c -lfl
	./tryreg >myout <exinp 2>err
clean:
	rm tryreg.c tryreg myout err
