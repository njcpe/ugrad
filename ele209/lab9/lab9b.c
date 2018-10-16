#include <stdio.h>


double factorial(int);
double power(double , int);
float sine(float);
float cose(float);
float expe(float);
float log_e(float);


int main()
{
 
  float  x;
  scanf("%f",&x);
  printf("sine(%f) = %6.6f\n", x , sine(x)); 
  printf("cose(%f) = %6.6f\n", x , cose(x));
  printf("expe(%f) = %6.6f\n", x , expe(x));
  printf("log_e(%f) = %6.6f\n" , x , log_e(x));
}

float sine(float x)
{
  int n=0;
  float sum=0; 
  for (n;n<100 ; n++)
  sum=sum+(power(-1,n)*power(x,2*n+1))/(factorial(2*n+1));
   return sum;
}

float cose(float x)

{
  int n=0;
  float sum=0;
  for(n;n<100 ; n++)
    sum=sum+(power(-1,n)*power(x,2*n))/(factorial(2*n));
  return sum;
}

float expe(float x)
{
  int n=0;
  float sum=0;
  for(n;n<100 ; n++)
      sum=sum+(power(x,n))/(factorial(n))
	;return sum;
}

float log_e (float x)
{
  int n=0;
  float sum=0;
  for (n;n<100 ; n++)
      sum=sum+(2/(2*n+1))*(power(((x-1)/(x+1)),2*n+1));
    return sum;

}

double factorial (int n)


{
  if(n==0)
    return 1;
  else 
    {
      double mult =1;
      int d = n;
      for(d>0;d--;) 
	{
	  mult=mult*n;
	  n--;
	}  
	  return mult;
    }      	
}

double power(double x, int  n)
{
  if (n==0)
    return 1;
  else
    {     
      double mult=1;
      for (n>0; n--;)
	  mult=mult*x;
	      return mult;
	  


    }

}
