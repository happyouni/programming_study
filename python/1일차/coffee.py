amer_price = 2000
cafe_price = 3000
capu_price = 3500
americanos = int(input("아메리카노 판매 개수: "))
cafelattes = int(input("카페라떼 판매 개수: "))
capucinos = int(input("카푸치노 판매 개수: "))
sales = americanos* amer_price
sales = sales + cafelattes* cafe_price
sales = sales + capucinos* capu_price
print("총 매출은", sales, "입니다.")
print('나는 현재 ' + 21 + '살이다.')
