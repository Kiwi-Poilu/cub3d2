NAME	=	cub3D

LIBFT	=	libft/libft.a

CC		=	clang

FLAGS	= -Wall -Wextra -Werror

SRCS	=	main.c \
			init.c \
			raycasting.c \
			display.c \
			parser.c \
			get_next_line.c \
			get_next_line_utils.c \
			keys.c \
			get_textures.c \
			get_textures2.c \
			fill_map.c \
			utils.c \
			utils2.c

INCS	=	$(addprefix include/, cub3d.h)

OBJS	=	$(addprefix srcs/,${SRCS:.c=.o})

all: $(NAME)

$(NAME): $(OBJS) $(INCS)
	make -C libft
	make -C mlx
	$(CC) $(FLAGS) -I include -o $(NAME) $(OBJS) libft/libft.a -Lmlx -lmlx -lX11 -lbsd -lm -lXext

%.o: %.c $(INCS)
	$(CC) $(FLAGS) -I include -Imlx -c $< -o $@

clean:
	make clean -C mlx
	make fclean -C libft
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re: fclean all

.PHONY: all clean fclean re
