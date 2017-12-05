PROJECT = sha3_nif

ERTS_INCLUDE_DIR != erl -noshell -s init stop -eval "io:format(\"~s/erts-~s/include/\", [code:root_dir(), erlang:system_info(version)])."

C_SRC_OUTPUT_DIR = ../priv
C_SRC_OUTPUT = $(C_SRC_OUTPUT_DIR)/$(PROJECT).so

CC ?= cc
CFLAGS =
CFLAGS += -I$(ERTS_INCLUDE_DIR)
CFLAGS += -O2
CFLAGS += -Wall
CFLAGS += -Wmissing-prototypes
CFLAGS += -fPIC
CFLAGS += -finline-functions
CFLAGS += -shared
RM ?= rm -f

SOURCES =
SOURCES += KeccakF-1600-opt64.c
SOURCES += KeccakNISTInterface.c
SOURCES += KeccakSponge.c
SOURCES += displayIntermediateValues.c
SOURCES += sha3_nif.c

.PHONY: clean

$(C_SRC_OUTPUT): $(C_SRC_OUTPUT_DIR) $(SOURCES)
	$(CC) $(CFLAGS) -o $@ $(SOURCES)

$(C_SRC_OUTPUT_DIR):
	mkdir -p $@

clean:
	$(RM) $(C_SRC_OUTPUT)
