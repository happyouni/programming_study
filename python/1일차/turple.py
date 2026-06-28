# 튜플 : 리스트와 다르게 값이 고정됨. ( )로 표시
int_tuple=(1,2,3,4)
print(int_tuple)     # (1, 2, 3, 4)
print(int_tuple[1])  # 2
print(int_tuple[2])  # 3
int_tuple[2]=10
# 값 변경안됨(값 고정)
print(int_tuple[2])  # 3

Str_tuple=("hello","aaa","ㅎㅎㅎ")
mix_tuple=(1,3,"ㅎㅎㅎ","파이썬")

# 튜플안에 튜플
tuple_in_tuple=("안녕",(1,10,"ㅎㅎㅎ"),"hello",1.23)
print(tuple_in_tuple)
