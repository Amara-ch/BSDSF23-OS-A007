#include <stdio.h>
#include "../include/hello.h"

int main() {
    printf("--- Testing Hello Function ---\n");
    say_hello();  // Call the function from hello.c

    // If you had more string/file functions, you would test them here
    printf("\n--- Testing File Functions ---\n");
    // Add file function tests here

    return 0;
}
