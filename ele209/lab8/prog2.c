#include <stdio.h>
#define STOP 0

int main()
{
  int int1;
  int int2;
  int int3;

  printf("===== Countdown Program =====\n");
  printf("Enter any integer! ");
  scanf("%d", &int1);

  printf("Enter any integer! ");
  scanf("%d", &int2);

  int3 = int1*int2;
  printf("%d",int3);
}
