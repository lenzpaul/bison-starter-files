

all: demo

demo: demod
	flex demo.lex
	bison demo.y
	gcc  demo.tab.c lex.yy.c -o demo


demod: demo.lex demo.y
	flex -d demo.lex
	bison -d demo.y
	gcc  demo.tab.c lex.yy.c -o demod

.PHONY: clean
clean: ;
	rm -f lex.yy.c demo.tab.c demo.tab.h rm demod demo
