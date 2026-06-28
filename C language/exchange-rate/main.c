#include <stdio.h>
#include "exchange.h"

int main() {
    double dollars = 50.0;
    printf("현재 환율: 1달러 = %.1f원\n", RATE);
    printf("보유하신 %.2f달러는 한국 돈으로 %.2f원입니다.\n",
        dollars, won(dollars));

    double money = 8500000.0;
    printf("보유하신 %.2f원은 달러 돈으로 %.2f달러입니다.\n",
        money, doll(money));
    return 0;

}

