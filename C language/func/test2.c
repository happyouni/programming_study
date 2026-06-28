#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
int main() {
    int num;
    scanf("%d", &num);
    if (num >= 30) printf("Hot\n");
    else if (num < 10) printf("Cold\n");
    else printf("Mild\n");
    return 0;
}
