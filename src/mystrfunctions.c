#include "../include/mystrfunctions.h"

// Returns length of string s
int mystrlen(const char* s) {
    int len = 0;
    while (*s++) len++;
    return len;
}

// Copies src to dest
int mystrcpy(char* dest, const char* src) {
    char* d = dest;
    while ((*d++ = *src++));
    return 0;
}

// Copies at most n characters from src to dest
int mystrncpy(char* dest, const char* src, int n) {
    int i;
    for (i = 0; i < n && src[i] != '\0'; i++)
        dest[i] = src[i];
    for (; i < n; i++)
        dest[i] = '\0';
    return 0;
}

// Concatenates src to dest
int mystrcat(char* dest, const char* src) {
    char* d = dest;
    while (*d) d++;
    while ((*d++ = *src++));
    return 0;
}
