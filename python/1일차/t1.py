import turtle #거북이 그래픽을 사용하여 그래픽을 만들 수 있는 Turtle 모듈
t = turtle.Turtle() #t라는 이름의 새 거북이 객체를 생성
t.shape("turtle") #거북이 모양을 거북이 아이콘으로 설정

# 사용자로부터 집의 크기를 받아서 size라는 변수에 저장한다. 
size = int(input("집의 크기는 얼마로 할까요? "))
t.color("brown")
t.begin_fill()
t.left(60) #왼쪽으로 60도 회전
t.forward(size) # ①
t.right(120) #오른쪽으로 120도 회전
t.forward(size) # ②
t.end_fill()

t.color("blue")
t.begin_fill()
t.right(30)
t.forward(size) # ③
t.right(90)
t.forward(size) # ④
t.right(90)
t.forward(size) # ⑤
t.right(90)
t.forward(size) # ⑥
t.end_fill()

turtle.done() #그리기가 완료된 후 사용자가 닫을 때까지 창을 열어둠
