CC = gcc
CFLAGS = -Iinclude
SRC = src/hello.c
OBJ = obj/hello.o
BIN = bin/hello

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(OBJ) -o $(BIN)

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJ)

clean:
	rm -f $(OBJ) $(BIN)
