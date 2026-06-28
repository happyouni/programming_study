package animalTest;

public class CatChild extends AnimalParent{
	String color;
	int weight;

	CatChild(String name, int age, String color,int weight) {
        super(name, age);
        this.color=color;
        this.weight=weight;
        		
    }

    @Override
    void speak() {
        System.out.println(name + "가 야옹~ 웁니다.");
    }
  
    void infoCat() {
        info();
        System.out.println("색상:"+ color+", 몸무게:"+weight+"kg");

    }
}
