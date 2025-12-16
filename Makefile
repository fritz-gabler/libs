NAME = libs.a
CC = cc
CFLAGS = -Wall -Wextra -Werror -g
HEADER := -I ./include
ARFLAGS := -rcs

###############################################################################
###############################################################################

VPATH =	 array char dubl_circular_list gnl io list memory string printf



SRC_ARR :=	ft_copy_dubble_array.c ft_count_doubble_array_quantity.c	\
			ft_free_dubble_array.c

SRC_CHAR :=	ft_isalnum.c ft_isalpha.c ft_isascii.c	ft_isdigit.c		\
			ft_isprint.c ft_tolower.c ft_toupper.c						\
			ft_free_string_save.c

SRC_CLIST := ft_clstnew.c ft_clstadd_back.c 							\
			 ft_clstclear.c ft_clstadd_front.c

SRC_GNL :=	ft_get_next_line.c ft_get_next_line_utils.c

SRC_IO :=	ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c 

SRC_LIST :=	ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c			\
			ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c		\
			ft_lstnew.c ft_lstsize.c

SRC_MEM :=	ft_bzero.c ft_calloc.c ft_memchr.c ft_memcmp.c				\
			ft_memcpy.c ft_memmove.c ft_memset.c

SRC_PRINT := ft_print_hex.c ft_print_num.c ft_print_ptr.c				\
			ft_print_str.c ft_print_uns.c ft_printf.c ft_put_char_mod.c

SRC_STR :=	ft_atoi.c ft_itoa.c	ft_strtol.c								\
			ft_split.c ft_strdup.c										\
			ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c		\
			ft_strlen.c ft_strmapi.c ft_strncmp.c						\
			ft_strnstr.c ft_strrchr.c ft_strtrim.c						\
			ft_substr.c ft_strjoin_mod_uns.c ft_strlen_uns.c			\
			ft_strchr.c

SRCS := $(SRC_ARR) $(SRC_CHAR) $(SRC_CLIST) $(SRC_GNL) $(SRC_IO) $(SRC_LIST) \
			$(SRC_MEM) $(SRC_PRINT) $(SRC_STR)

###############################################################################
###############################################################################

OBJ_DIR := ./_obj
OBJS := $(addprefix $(OBJ_DIR)/, $(SRCS:ft_%.c=%.o))

###############################################################################
###############################################################################

all: $(NAME)

$(NAME): $(OBJS)
	@mkdir -p libs
	@echo $(Y)Compiling [$(NAME)]...$(X)
	@ar $(ARFLAGS) $(NAME) $(OBJS)
	@printf $(UP)$(CUT)
	@echo $(G)Finished" " [$(NAME)]...$(X)

###############################################################################
###############################################################################

$(OBJ_DIR)/%.o: ft_%.c
	@echo $(Y)Compiling [$@]...$(X)
	@mkdir -p _obj
	@$(CC) $(CFLAGS) -c $< $(HEADER) -o $@
	@printf $(UP)$(CUT)

clean:
	@if [ -d "${OBJ_DIR}" ]; then \
		echo $(R)Cleaning"  "[$(OBJ_DIR)]...$(X); \
		rm -rf ${OBJ_DIR}; \
		echo $(G)Cleaned!$(X); \
	fi

fclean: clean
	@if [ -f "$(NAME)" ]; then \
		echo $(R)Cleaning"  "[$(NAME)]...$(X); \
		rm -rf $(NAME); \
		echo $(G)Cleaned!$(X); \
	fi

re: fclean all

###############################################################################
###############################################################################

Y := "\033[33m"
C := "\033[36m"
R := "\033[31m"
G := "\033[32m"
X := "\033[0m"
UP := "\033[A"
CUT := "\033[K"
