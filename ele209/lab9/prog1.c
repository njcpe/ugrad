#include <stdio.h>

double factorial(int n);
double power(double x, int n);

/* Main Fn. */
int main()
{
  int n;

for (n = 0; n<= 5; n++)
  printf("factorial(%d) = %6.2f\n", n , factorial(n));
for (n = 0; n <= 5; n++)
  printf("power(3, %d) = %6.2f\n", n, power(3, n));
}
double factorial (int n)
{
 double value=1; 
 int j;
for(j=n; j>1;j--)
  value = value*j;
  return value;

}

double power(double x, int n)
{
double sum=0
  ;double value=1;
if(n==0)
  return value;
int f;
for(f=n;f>0;f--)
  value = value*x;
return value;
}
