#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define max(a,b)				\
  ({ __typeof__ (a) _a = (a);			\
    __typeof__ (b) _b = (b);			\
    _a > _b ? _a : _b; })

double uniform_rv(int lo, int hi){
  return((double)lo+rand()/(RAND_MAX/((double)hi-(double)lo)+1));
}

int main(int argc, char* argv[]){
  FILE* fp;
  int i;
  int T = 1000000;
  double lambda = 0.0;
  double mu = 0.5;
  int A = 0;
  int S = 0;
  int Q;
  double Q_avg;
  
  srand(time(NULL));
  fp = fopen("GD1.txt","w+");
  for(lambda=0.01;lambda<0.50;lambda+=0.01){
    Q = 0;
    Q_avg = 0;
    for(i=0;i<T;i++){
      A = (uniform_rv(0,1)<lambda)?1:0;
      mu = !mu;
      Q = max(Q+A-mu,0);
      Q_avg += Q;
    }
    Q_avg /= (double)T;
    fprintf(fp,"%.3f, %.3f\n",lambda, Q_avg);
  }
  fclose(fp);
}


