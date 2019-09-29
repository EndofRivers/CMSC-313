AS=nasm
LD=ld
ASFLAGS=-f elf64 -g -F dwarf
.PREFIXES= .o .asm

ASM_SOURCE=atbash.asm

ALL_TARGETS=atbash

ASM_OBJECTS=${ASM_SOURCE:.asm=.o}

all: ${ALL_TARGETS}

%.o: %.asm
	${AS} ${ASFLAGS} $< -o $@

${ALL_TARGETS}: ${ASM_OBJECTS}
	${LD} ${LDFLAGS} -o $@ $<

clean:
	rm -f *.o ${ALL_TARGETS}
	rm *~

run:
	./atbash
