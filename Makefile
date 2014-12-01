NAME=screeps.coffee

SOURCE= class/peon.coffee \
				class/soldat.coffee \
				class/recolteur.coffee \
				\
				script/main.coffee

RM = rm -f

all: $(NAME)

$(NAME): concatene
	coffee -c $(NAME)

concatene:
	cat $(SOURCE) > $(NAME)

clear: clean
clean:
	$(RM) $(NAME)

fclean: clean
	$(RM) screeps.js

re: fclean all

.PHONY: clean fclean re concatene clear
