#include <stdio.h>
#define STOP 0
#define END 33

int main()
{
  char c = (char)END;
  int counter;
  char startPoint;

  printf("===== Countdown Program =====\n");
  printf("Enter any ASCII character! ");
  scanf("%c", &startPoint);

  for(counter = startPoint; counter >= c; counter--)
    printf("%c\n", counter);
}
