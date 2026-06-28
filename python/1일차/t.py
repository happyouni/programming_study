import turtle #모듈( 파이썬에서 대화식 그림 및 애니메이션을 만드는 데 사용되는 터틀 그래픽 라이브러리를 활용)
# 모듈은 파이썬 코드를 포함하는 파일로, 함수, 클래스 및 변수를 정의
# 터틀 그래픽 라이브러리에서 기능을 가져옴
t = turtle.Turtle() #turtle객체를 생성하고 t 변수에 할당, 화면 그리는데 사용
t.shape("turtle") #사용자정의 모양 제공

radius = 50  # 변수선언 후 50 할당 
t.circle(radius) # 반지름이 50인 원이 그려 진다.
t.fd(30) # 그림을 그리지 않고 30 단위 앞으로 이동 
t.circle(radius) # 반지름이 50인 원이 그려 진다.
t.fd(30)
t.circle(radius) # 반지름이 50인 원이 그려 진다.
# 한 변의 길이가 2 * radius인 정사각형 그리기
t.fd(50)
for _ in range(4):
    t.forward(2 * radius)  # 앞으로 이동
    t.right(90)            # 우측으로 직각으로 회전
# 한 변의 길이가 2 * radius인 정삼각형 그리기
for _ in range(3):
    t.forward(2 * radius)  # 앞으로 이동
    t.left(120)            # 120도 각도로 왼쪽으로 회전
