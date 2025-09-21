CC = gcc
CFLAGS = -Iinclude -fPIC

# Source files
HELLO_SRC = src/hello.c
MAIN_SRC = src/main.c

# Object files
HELLO_OBJ = obj/hello.o
MAIN_OBJ = obj/main.o

# Libraries and executables
STATIC_LIB = lib/libmyutils.a
DYNAMIC_LIB = lib/libmyutils.so
STATIC_BIN = bin/client_static
DYNAMIC_BIN = bin/client_dynamic

# Default target
all: $(STATIC_LIB) $(DYNAMIC_LIB) $(STATIC_BIN) $(DYNAMIC_BIN)

# Build static library
$(STATIC_LIB): $(HELLO_OBJ)
	ar rcs $(STATIC_LIB) $(HELLO_OBJ)

# Build dynamic library
$(DYNAMIC_LIB): $(HELLO_OBJ)
	$(CC) -shared -o $(DYNAMIC_LIB) $(HELLO_OBJ)

# Compile hello.o
$(HELLO_OBJ): $(HELLO_SRC)
	$(CC) $(CFLAGS) -c $(HELLO_SRC) -o $(HELLO_OBJ)

# Compile main.o
$(MAIN_OBJ): $(MAIN_SRC)
	$(CC) $(CFLAGS) -c $(MAIN_SRC) -o $(MAIN_OBJ)

# Build static executable
$(STATIC_BIN): $(MAIN_OBJ) $(STATIC_LIB)
	$(CC) $(MAIN_OBJ) $(STATIC_LIB) -o $(STATIC_BIN)

# Build dynamic executable
$(DYNAMIC_BIN): $(MAIN_OBJ) $(DYNAMIC_LIB)
	$(CC) $(MAIN_OBJ) -Llib -lmyutils -o $(DYNAMIC_BIN)

# Install target
install:
	sudo cp $(STATIC_BIN) /usr/local/bin/client
	sudo cp $(DYNAMIC_BIN) /usr/local/bin/client_dynamic
	sudo mkdir -p /usr/local/share/man/man3
	sudo cp man/man3/client.1 /usr/local/share/man/man3/

clean:
	rm -f obj/*.o bin/* lib/*.a lib/*.so
