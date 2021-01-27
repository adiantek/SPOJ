// https://www.spoj.com/problems/PALIN/

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void increment(char *n, int len) {
  int i;
  for (i = len - 1; i >= 0; i--) {
    n[i]++;
    if (n[i] > '9') {
      n[i] = '0';
    } else {
      return;
    }
  }
}

bool is9(char *n, int len) {
  while (*n++ == '9' && len--)
    ;
  return !len;
}

bool isPalindrom(char *n, int len) {
  int i;
  for (i = len / 2 - 1; i >= 0; i--) {
    if (n[i] != n[len - i - 1]) {
      return 0;
    }
  }
  return 1;
}

char *makePalindrom(char *n, int len) {
  if (len == 1) {
    return n;
  }
  bool x = len & 1;
  int half = (len + 1) / 2;
  char *n2 = (char *)malloc(len + 1);
  memcpy(n2, n, half);
  int i;
  for (i = len / 2 - 1; i >= 0; i--) {
    n2[len - i - 1] = n2[i];
  }
  n2[len] = 0;
  return n2;
}

int main() {

  int T;
  scanf("%d", &T);
  char *n = (char *)malloc(1000002);
  while (T--) {
    scanf("%s", n);
    int len = strlen(n);
    if (is9(n, len)) {
      printf("1");
      int i;
      for (i = 0; i < len - 1; i++) {
        printf("0");
      }
      printf("1\n");
    } else {
      char *n2 = makePalindrom(n, len);
      if (strcmp(n, n2) >= 0) {
        char *n3 = n2;
        increment(n3, (len + 1) / 2);
        n2 = makePalindrom(n3, len);
        if (n3 != n)
          free(n3);
      }
      printf("%s\n", n2);
      if (n2 != n)
        free(n2);
    }
  }
  free(n);
  return 0;
}