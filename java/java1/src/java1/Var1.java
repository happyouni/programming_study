package java1;

public class Var1 {

    public static void main(String[] args) {
        int a = 100; //정수
        long l = 10000000000L;
        float f = 10.5f;
        double b = 10.5; //실수
        boolean c = true; //불리언(boolean) true, false 입력 가능, 1바이트
        char d = 'A'; //문자 하나 문자 하나가 2바이트
        String e = "Hello Java"; //문자열, 문자열을 다루기 위한 특별한 타입

        System.out.println(a);
        System.out.println(l);
        System.out.println(f);
        System.out.println(b);
        System.out.println(c);
        System.out.println(d);
        System.out.println(e);
// 한 줄에 쭉 출력하기
System.out.println(a + ", " + l + ", " + b + ", " + f + ", " + c + ", " + d + ", " + e);
// 역슬래시 n(\n)은 "엔터 키"와 같은 역할을 해요.
System.out.println(a + "\n" + l + "\n" + b + "\n" + f + "\n" + c + "\n" + d + "\n" + e);
// %d(정수), %f(실수), %b(불리언), %c(문자), %s(문자열)
System.out.printf("%d, %d, %.1f, %.1f, %b, %c, %s", a, l, b, f, c, d, e);
    }
}
