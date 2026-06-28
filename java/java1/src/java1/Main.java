package java1;

public class Main {
	public static void main(String[] args) {
		System.out.printf("원주율=%.3f\n", 3.141592);
		System.out.printf("%d +%d = %d\n", 3, 5, 3 + 5);
		
		int x=5;
		System.out.println(x++ + ++x);  //12
		
		System.out.println(2*1000+26+"path");//+는 숫자일때는 연산을 문자열은 결합으로 동작
		
		String a="hello";
		String b= new String("hello");
		System.out.println(a == b); // 두 변수가 같은 객체를 가리키는 것 비교
		                                 //a는 문자열 리터럴이고 b는 새로 생성된 객체
		System.out.println(a.equals(b)); // 문자열 내용이 같은지 비교
		
	}
}
