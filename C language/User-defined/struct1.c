//library01.c
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h>
#include <string.h>

int main() {
    //pow(2, 3): 거듭제곱을 구하는 함수
    // .sqrt(9): 제곱근(루트)을 구하는 함수
    printf("%.0f", pow(2, 3) + sqrt(9));

    //------------------------
    int a[5] = { 1, 2, 3, 4, 5 };
    memset(a, 0, sizeof(a)); //<string.h>에 정의된 메모리 초기화 함수
    //배열 a의 시작 주소부터 배열 전체 크기(sizeof(a))만큼의 메모리 공간을 모두 0으로 채워 넣습니다.
    printf("%d", a[4]);

    //----------------------
        char name[3][10] = { "Lee", "Kim", "Park" };
        char temp[10];
        int i, j;

        for (i = 0; i < 2; i++) {
            for (j = i + 1; j < 3; j++) {
                if (strcmp(name[i], name[j]) > 0) {
                    strcpy(temp, name[i]);
                    strcpy(name[i], name[j]);
                    strcpy(name[j], temp);
                }
            }
        }

        for (i = 0; i < 3; i++) {
            printf("%s ", name[i]);
        }

        //조건식반환 값두 문자열의 관계 (사전 순)
        // strcmp(A, B) == 00A와 B가 동일한 문자열임
        // strcmp(A, B) < 0음수A가 B보다 앞에 옴 (A ➡️ B)
        // strcmp(A, B) > 0양수A가 B보다 뒤에 옴 (B ➡️ A)
        //-------------------
        //<string.h> 헤더에 정의된 문자열 이어붙이기(Concatenate) 함수
        char a[10] = "AB";
        char b[] = "CD";
        strcat(a, b);
        printf("%s", a);
    }

