# 딕셔너리(dictionary):매핑형(key, value)
# 자바의 HashMap 또는 json과 유사함

word_dic={
    "dog":"강아지",
    "cat":"고양이",
    "tiger":"호랑이",
    "lion":"사자"
}
print(word_dic)            
# {'dog':'강아지','cat':'고양이','tiger':'호랑이','lion':'사자'}
print(word_dic["dog"])      # 강아지->value 값 출력
# 기존 value 수정
word_dic["dog"]="멍멍이"     
# value인 강아지를 멍멍이로 변경

#  새로운 데이터 추가
word_dic["bear"]="곰"
print(word_dic)  
# {'dog':'멍멍이','cat':'고양이','tiger':'호랑이','lion':'사자','bear':'곰'}