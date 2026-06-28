package animalTest;

public class AnimalParent {
	
	    String name;
	    int age;

	    AnimalParent (String name, int age) {
	        this.name = name;
	        this.age = age;
	    }

	    void speak() {
	        System.out.println(name + "이(가) 소리를 냅니다.");
	    }

	    void info() {
	        System.out.println("이름: " + name + ", 나이: " + age + "세");
	    }
	}

