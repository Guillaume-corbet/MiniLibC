##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## minilibC
##

NAME	=	libasm.so

FLAGS	=	-W -Wall -Werror -Wextra -Wunused-macros -Wendif-labels -pedantic -Wcomment -Wmissing-braces -Wmissing-include-dirs -Wparentheses -Wsequence-point -ansi -ggdb -Wunused -Wduplicated-branches -Wmisleading-indentation

all:	$(NAME)

$(NAME):
		nasm -f elf64 memcpy.asm
		nasm -f elf64 memmove.asm
		nasm -f elf64 memset.asm
		nasm -f elf64 strchr.asm
		nasm -f elf64 strlen.asm
		nasm -f elf64 strncmp.asm
		nasm -f elf64 rindex.asm
		nasm -f elf64 strcasecmp.asm
		nasm -f elf64 strstr.asm
		nasm -f elf64 strcmp.asm
		nasm -f elf64 strpbrk.asm
		nasm -f elf64 strcspn.asm
		ld -o $(NAME) -shared *.o

clean:
		rm -f $(NAME)

fclean:
		rm -f $(NAME)
		rm -f *~
		rm -f *#

re:		fclean all

test:	fclean all
		gcc big_main.c *.o
		./a.out