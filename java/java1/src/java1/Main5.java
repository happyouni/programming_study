abstract class Payment {

    // 추상 메서드
    abstract void pay();

    // 일반 메서드
    void start() {
        System.out.println("결제 시작");
    }
}

// 카드 결제 클래스
class CardPayment extends Payment {

    @Override
    void pay() {
        System.out.println("카드 결제");
    }
}

// 카카오페이 클래스
class KakaoPay extends Payment {

    @Override
    void pay() {
        System.out.println("카카오페이 결제");
    }
}

// 메인 클래스
public class Main5 {
    public static void main(String[] args) {

        // 객체 생성
        CardPayment card = new CardPayment();
        KakaoPay kakao = new KakaoPay();

        // 카드 결제 실행
        card.start();
        card.pay();

        System.out.println();

        // 카카오페이 실행
        kakao.start();
        kakao.pay();
    }
}

