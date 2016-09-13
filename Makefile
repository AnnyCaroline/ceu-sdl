CEU_DIR = /data/ceu/ceu

samples:
	for i in samples/sdl-*.ceu; do                                          \
		echo;                                                               \
		echo "###############################################";             \
		echo File: "$$i -> /tmp/$$(basename $$i .ceu)";	                    \
		echo "###############################################";             \
		echo -n "Press <enter> to start...";                                \
		read _;                                                             \
	    ceu --pre --pre-args="-I$(CEU_DIR)/include -I./include"             \
	              --pre-input=$$i                                           \
	        --ceu                                                           \
	        --env --env-types=$(CEU_DIR)/env/types.h                        \
	              --env-threads=$(CEU_DIR)/env/threads.h                    \
	              --env-main=$(CEU_DIR)/env/main.c                          \
	        --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	             --cc-output=/tmp/$$(basename $$i .ceu);                     \
		/tmp/$$(basename $$i .ceu);	                                        \
		echo ">>> OK";                                                      \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
		echo;                                                               \
	done

.PHONY: samples
