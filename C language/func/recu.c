// 함수는 자기 자신을 호출할 수도 있다. 이것을 순환(recursion)라고 부른다.
// 재귀 호출(recursive call)이란 함수 내부에서 함수가 자기 자신을 또다시 호출하는 행위(tmtmfh ghcnf)
// 함수 내에 재귀 호출을 중단하도록 조건이 변경될 명령문을 반드시 포함

//다음 코드에서 입력값이 5가 들어갔을때의 출력값을 쓰시오.
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main()
{
	int a;
	printf("숫자를 입력하세요 : ");
	scanf("%d", &a);
	printf("%d", func(a)); // a를 인수로 보내면서 func함수 호출하여 받은 결과를 출력
}

int func(int a)
{
	if (a <= 1) return 1;  // 순환 호출을 멈추는 부분, 1 반환
	return a * func(a - 1);   //  자기 자신을 순환적으로 호출하다가 결과를 반환
}
