# Compiler and flags
CC = gcc
CFLAGS = -Iinclude

# Source and object files
SRC_HELLO = src/hello.c
OBJ_HELLO = obj/hello.o

SRC_MAIN = src/main.c
OBJ_MAIN = obj/main.o

# Targets
LIB = lib/libmyutils.a
BIN = bin/client_static

# Default target
all: $(LIB) $(BIN)

# Create static library from hello.o
$(LIB): $(OBJ_HELLO)
	ar rcs $(LIB) $(OBJ_HELLO)

# Compile hello.c → hello.o
$(OBJ_HELLO): $(SRC_HELLO)
	$(CC) $(CFLAGS) -c $(SRC_HELLO) -o $(OBJ_HELLO)

# Compile main.c → main.o
$(OBJ_MAIN): $(SRC_MAIN)
	$(CC) $(CFLAGS) -c $(SRC_MAIN) -o $(OBJ_MAIN)

# Link main.o + static library → executable
$(BIN): $(OBJ_MAIN) $(LIB)
	$(CC) $(OBJ_MAIN) $(LIB) -o $(BIN)

# Clean build
clean:
	rm -f obj/*.o $(BIN) lib/*.a
