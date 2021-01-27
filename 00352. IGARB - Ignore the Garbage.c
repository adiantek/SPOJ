// https://www.spoj.com/problems/IGARB/

#include <stdbool.h>
#include <stdio.h>

char divide(char *num) {
  char res = *num - '0';
  bool zero = true;
  while (true) {
    if (*num != '0') {
      zero = false;
    }
    *num = (res / 7) + '0';
    if (*(num + 1)) {
      res = (res % 7) * 10 + (*(num + 1)) - '0';
    } else {
      return zero ? -1 : res % 7;
    }
    num++;
  }
}

int main() {
  int t;
  scanf("%d", &t);
  char k[250];
  char output[250];
  output[249] = 0;
  char *map = "0125986";
  while (t--) {
    scanf("%s", k);
    if (k[0] == '0' && k[1] == 0) {
      printf("0\n");
      continue;
    }
    int pos = 0;
    while (true) {
      char res = divide(k);
      if (res == -1) {
        output[pos] = 0;
        printf("%s\n", output);
        break;
      }
      output[pos++] = map[(unsigned int)res];
    }
  }
  return 0;
}