#include <stdio.h>

int main() {
    int a[3] = { 1,2,3 };
    int* p = a;
    int** pp = &p;

    printf("%d\n", *(*pp + 1));
}
