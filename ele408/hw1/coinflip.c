#include <stdio.h>
#include <stdlib.h>
#include <time.h>



int main(int argc, char* argv[]){
  srand(time(NULL));

  int i;
  int heads=0;
  int tails=0;
  int flipVal;

  for(i=0;i<2000;i++){
    flipVal = rand();
    if(flipVal % 2 == 0){
      heads++;
    }else{
      tails++;
    }
  }
  printf("\nResults:\nHeads:\t%d\nTails:\t%d\n",heads,tails);

return(0);
}
