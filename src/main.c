#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");

    char str1[100], str2[100];
    mystrcpy(str1, "Hello");
    mystrcpy(str2, "World");
    mystrcat(str1, " ");
    mystrcat(str1, str2);
    printf("Concatenated String: %s\n", str1);
    printf("Length: %d\n", mystrlen(str1));

    printf("\n--- Testing File Functions ---\n");
    FILE* fp = fopen("sample.txt", "r");
    if (fp) {
        int lines, words, chars;
        wordCount(fp, &lines, &words, &chars);
        printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);
        fclose(fp);
    } else {
        printf("File sample.txt not found!\n");
    }

    return 0;
}
