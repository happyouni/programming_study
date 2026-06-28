#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
int add(int a, int b);
int sub(int a, int b);
int mul(int a, int b);
double divi(int a, int b);
void print1(int a, int b, char op, int r1);
void print2(int a, int b, char op, double r2);
//void print3(int a, int b, char op, int r1, double r2) 

int main() {
    int a, b;
    char op, end;
    int res1;
    double res2;
    while (1)
    {
        printf("첫 번째 숫자 입력: ");
        scanf("%d", &a); 

        printf("연산자 입력 (+ - * /): ");
        scanf(" %c", &op);

        printf("두 번째 숫자 입력: ");
        scanf("%d", &b);

        switch (op)
        {
        case '+':
            res1 = add(a, b);
            break;

        case '-':
            res1 = sub(a, b);
            break;

        case '*':
            res1 = mul(a, b);
            break;

        case '/':
            res2 = divi(a, b);
            break;
        }

        if (op == '+' || op == '-' | op == '*')
            print1(a, b, op, res1);
        else if (op == '/')
            print1(a, b, op, res2);
        else
            printf("잘못된 연산자입니다\n");

        printf("연산을 종료하시겠습니까?(Y/y) ");
        scanf(" %c", &end); //scanf_s("%c", &end,1);
        if (end == 'Y' || end == 'y')
            break;
    }
    return 0;
}//main

int add(int a, int b) {
    return a + b;
}

int sub(int a, int b) {
    return a - b;
}

int mul(int a, int b) {
    return a * b;
}

double divi(int a, int b) {
    return (double)a / b;
}

void print1(int a, int b, char op, int r1) {
    printf("%d %c %d = %d\n", a, op, b, r1);
}

void print2(int a, int b, char op, double r2) {
    printf("%d %c %d = %.2f\n", a, op, b, r2);
}
