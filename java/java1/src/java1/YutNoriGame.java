package java1;

import java.util.Scanner;

public class YutNoriGame{

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("윷을 던지세요>>");

		int zeroCount = 0; // 0의 개수 카운트
		int n1 = scanner.nextInt();
		if(n1 == 0)
			zeroCount++;
		
		int n2 = scanner.nextInt();
		if(n2 == 0)
			zeroCount++;
		
		int n3 = scanner.nextInt();
		if(n3 == 0)
			zeroCount++;
		
		int n4 = scanner.nextInt();	
		if(n4 == 0)
			zeroCount++;
		
		if(zeroCount == 0) 
			System.out.println("모입니다.");
		else if(zeroCount == 1) 
			System.out.println("도입니다.");
		if(zeroCount == 2) 
			System.out.println("개입니다.");
		if(zeroCount == 3) 
			System.out.println("글입니다.");
		if(zeroCount == 4) 
			System.out.println("윶입니다.");
		
		scanner.close();
	}

}
