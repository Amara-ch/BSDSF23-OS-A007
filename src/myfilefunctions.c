#include "../include/myfilefunctions.h"
#include <stdlib.h>
#include <string.h>

int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file) return -1;
    int l = 0, w = 0, c = 0;
    int in_word = 0;
    char ch;
    while ((ch = fgetc(file)) != EOF) {
        c++;
        if (ch == '\n') l++;
        if (ch == ' ' || ch == '\n' || ch == '\t') in_word = 0;
        else if (!in_word) { in_word = 1; w++; }
    }
    if (lines) *lines = l;
    if (words) *words = w;
    if (chars) *chars = c;
    return 0;
}

int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str || !matches) return -1;
    size_t count = 0, capacity = 10;
    char** result = malloc(sizeof(char*) * capacity);
    char buffer[1024];
    while (fgets(buffer, sizeof(buffer), fp)) {
        if (strstr(buffer, search_str)) {
            if (count >= capacity) {
                capacity *= 2;
                result = realloc(result, sizeof(char*) * capacity);
            }
            result[count] = strdup(buffer);
            count++;
        }
    }
    *matches = result;
    return count;
}
