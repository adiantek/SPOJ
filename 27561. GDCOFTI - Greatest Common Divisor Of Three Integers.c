#include <stdio.h>

typedef unsigned long long int ULLI;

ULLI gcd(ULLI a, ULLI b) {
  while (b != 0) {
    ULLI c = b;
    b = a % b;
    a = c;
  }
  return a;
}

int main() {
  ULLI a, b, c;
  scanf("%llu%llu%llu", &a, &b, &c);
  printf("%llu\n", gcd(gcd(a, b), c));
  return 0;
}