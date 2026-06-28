#include "exchange.h"

// 달러 -> 원화 계산
double won(double usd) {
    return usd * RATE;
}

// 원화 -> 달러 계산
double doll(double krw) {
    return krw / RATE;
}
