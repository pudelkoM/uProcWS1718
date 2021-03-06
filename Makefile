.PHONY:exe 

PROGRAM = toupper
SHELL := /bin/sh

sources = $(PROGRAM).c

VARIANTS = $(PROGRAM)_variant1
VARIANTS += $(PROGRAM)_variant2
VARIANTS += $(PROGRAM)_variant3
VARIANTS += $(PROGRAM)_variant4


#CC = gcc
# CC = icc -fsource-asm -fno-alias -lm 
CC = clang

CFLAGS = -march=native -Wall -std=gnu11 -fomit-frame-pointer -lm
CFLAGS_DEBUG = -march=native -Wall -std=gnu11 -fno-omit-frame-pointer -fsanitize=address -g -lm

$(PROGRAM)_variant1 = $(CC) $(CFLAGS) -O0 $(sources)
$(PROGRAM)_variant2 = $(CC) $(CFLAGS) -O1 $(sources)
$(PROGRAM)_variant3 = $(CC) $(CFLAGS) -O2 $(sources)
$(PROGRAM)_variant4 = $(CC) $(CFLAGS) -O3 $(sources)

PARAMS = 80000

#############################################################################################


exe: .autoclean $(VARIANTS) Makefile
	if test -f ./$(PROGRAM)_variant1; then ./$(PROGRAM)_variant1 $(PARAMS) > results1;else rm -f results1; fi
	if test -f ./$(PROGRAM)_variant2; then ./$(PROGRAM)_variant2 $(PARAMS) > results2;else rm -f results2;fi
	if test -f ./$(PROGRAM)_variant3; then ./$(PROGRAM)_variant3 $(PARAMS) > results3;else rm -f results3;fi
	if test -f ./$(PROGRAM)_variant4; then ./$(PROGRAM)_variant4 $(PARAMS) > results4;else rm -f results4;fi
	if test -f ./$(PROGRAM)_variant5; then ./$(PROGRAM)_variant5 $(PARAMS) > results5;else rm -f results5;fi
	if test -f ./$(PROGRAM)_variant6; then ./$(PROGRAM)_variant6 $(PARAMS) > results6;else rm -f results6;fi
	if test -f ./$(PROGRAM)_variant7; then ./$(PROGRAM)_variant7 $(PARAMS) > results7;else rm -f results7;fi
	if test -f ./$(PROGRAM)_variant8; then ./$(PROGRAM)_variant8 $(PARAMS) > results8;else rm -f results8;fi
	if test -f ./$(PROGRAM)_variant9; then ./$(PROGRAM)_variant9 $(PARAMS) > results9;else rm -f results9;fi
	if test -f ./results1; then cat results1 > results; else rm -f results; fi
	if test -f ./results2; then cat results2 >> results; fi
	if test -f ./results3; then cat results3 >> results; fi
	if test -f ./results4; then cat results4 >> results; fi
	if test -f ./results5; then cat results5 >> results; fi
	if test -f ./results6; then cat results6 >> results; fi
	if test -f ./results7; then cat results7 >> results; fi
	if test -f ./results8; then cat results8 >> results; fi
	if test -f ./results9; then cat results9 >> results; fi
	cat results;
	if test -f options.h; then rm options.h;fi

$(PROGRAM)_variant1: $(sources) Makefile
	echo '#define OPTS "VARIANT1: $($(PROGRAM)_variant1)"' > options.h 
	$($(PROGRAM)_variant1) -S -o $(PROGRAM)_variant1.s
	$($(PROGRAM)_variant1) -o $(PROGRAM)_variant1
$(PROGRAM)_variant2: $(sources) Makefile
	echo '#define OPTS "VARIANT2: $($(PROGRAM)_variant2)"' > options.h 
	$($(PROGRAM)_variant2) -S -o $(PROGRAM)_variant2.s
	$($(PROGRAM)_variant2) -o $(PROGRAM)_variant2
$(PROGRAM)_variant3: $(sources) Makefile
	echo '#define OPTS "VARIANT3: $($(PROGRAM)_variant3)"' > options.h 
	$($(PROGRAM)_variant3) -S -o $(PROGRAM)_variant3.s
	$($(PROGRAM)_variant3) -o $(PROGRAM)_variant3
$(PROGRAM)_variant4: $(sources) Makefile
	echo '#define OPTS "VARIANT4: $($(PROGRAM)_variant4)"' > options.h 
	$($(PROGRAM)_variant4) -S -o $(PROGRAM)_variant4.s
	$($(PROGRAM)_variant4) -o $(PROGRAM)_variant4
$(PROGRAM)_variant5: $(sources) Makefile
	echo '#define OPTS "VARIANT5: $($(PROGRAM)_variant5)"' > options.h 
	$($(PROGRAM)_variant5) -S  -o $(PROGRAM)_variant5.s
	$($(PROGRAM)_variant5) -o $(PROGRAM)_variant5
$(PROGRAM)_variant6: $(sources) Makefile
	echo '#define OPTS "VARIANT6: $($(PROGRAM)_variant6)"' > options.h 
	$($(PROGRAM)_variant6) -S -o $(PROGRAM)_variant6.s
	$($(PROGRAM)_variant6) -o $(PROGRAM)_variant6
$(PROGRAM)_variant7: $(sources) Makefile
	echo '#define OPTS "VARIANT7: $($(PROGRAM)_variant7)"' > options.h 
	$($(PROGRAM)_variant7) -S -o $(PROGRAM)_variant7.s
	$($(PROGRAM)_variant7) -o $(PROGRAM)_variant7
$(PROGRAM)_variant8: $(sources) Makefile
	echo '#define OPTS "VARIANT8: $($(PROGRAM)_variant8)"' > options.h 
	$($(PROGRAM)_variant8) -S -o $(PROGRAM)_variant8.s
	$($(PROGRAM)_variant8) -o $(PROGRAM)_variant8
$(PROGRAM)_variant9: $(sources) Makefile
	echo '#define OPTS "VARIANT9: $($(PROGRAM)_variant9)"' > options.h 
	$($(PROGRAM)_variant9) -S -o $(PROGRAM)_variant9.s
	$($(PROGRAM)_variant9) -o $(PROGRAM)_variant9

.autoclean: Makefile
	make clean
	touch .autoclean

.PHONY: clean
clean:
	rm -f *_variant* results*

