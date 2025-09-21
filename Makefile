# Compiler and flags
CC = gcc
CFLAGS = -Iinclude

# Source files
STR_SRC = src/mystrfunctions.c
FILE_SRC = src/myfilefunctions.c
MAIN_SRC = src/main.c

# Object files
STR_OBJ = obj/mystrfunctions.o
FILE_OBJ = obj/myfilefunctions.o
MAIN_OBJ = obj/main.o

# Executable
BIN = bin/client

# Default target
all: $(BIN)

# Build the executable
$(BIN): $(STR_OBJ) $(FILE_OBJ) $(MAIN_OBJ)
	$(CC) $(STR_OBJ) $(FILE_OBJ) $(MAIN_OBJ) -o $(BIN)

# Compile string functions
$(STR_OBJ): $(STR_SRC)
	$(CC) $(CFLAGS) -c $(STR_SRC) -o $(STR_OBJ)

# Compile file functions
$(FILE_OBJ): $(FILE_SRC)
	$(CC) $(CFLAGS) -c $(FILE_SRC) -o $(FILE_OBJ)

# Compile main
$(MAIN_OBJ): $(MAIN_SRC)
	$(CC) $(CFLAGS) -c $(MAIN_SRC) -o $(MAIN_OBJ)

# Clean objects and binary
clean:
	rm -f obj/*.o bin/*

# Install executable (optional)
install: $(BIN)
	sudo cp $(BIN) /usr/local/bin/client
