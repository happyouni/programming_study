#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

//int main() {
//    // 1. data.txt 파일을 읽기(r) 모드로 열고, 그 주소를 파일 포인터 변수 fp에 저장
//  //FILE *fp: 열린 파일의 정보를 담고 있는 주소를 fp라는 포인터 변수에 저장하라는 뜻입니다. 이제부터 fp를 통해 이 파일에 접근할 수 있게 됩니다.
//
//    FILE* fp = fopen("data.txt", "r");
//
//    // 2. 문자열을 저장할 크기 10의 배열 선언
//    char str[10];
//
//    // 3. fp(파일)로부터 최대 9글자를 읽어와 str 배열에 저장 (마지막 1칸은 \0)
//    fgets(str, 10, fp);
//
//    // 4. 대괄호 안에 읽어온 문자열을 넣어 출력 -> [Hello Wor]
//    printf("[%s]", str);
//
//    return 0;
//}

int main() {
    // data.txt 파일을 읽기("r") 모드로 열고, 그 위치 주소를 파일 포인터 fp에 저장합니다.
    FILE* fp = fopen("data2.txt", "r");

    // fp가 가리키는 파일의 맨 첫 글자(1바이트)를 읽어와 정수형 변수 ch에 저장합니다.
    int ch = fgetc(fp);

    // 변수 ch에 저장된 문자를 화면에 출력합니다.
    printf("%c", ch);
    //  읽기 작업이 끝났으므로 반드시 파일을 닫아줍니다.
    fclose(fp);

    //  변수 재사용! (FILE* 를 다시 붙이지 않습니다)
    // 쓰기("w") 모드로 새로 열기 (기존 파일이 있으면 덮어씁니다)
    fp = fopen("data3.txt", "w");
    fprintf(fp, "hello\n");
    fprintf(fp, "123");
    printf("작업끝");

    fclose(fp);

    return 0;
}