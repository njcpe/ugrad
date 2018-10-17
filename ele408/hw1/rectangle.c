#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    int i,j;
    int len;
    if(argc < 2){
      printf("no vars given\n");
      return(1);
    }
    len = atoi(argv[1]);
    if(len<1||len>10||argc < 2){ 
        printf("input outside of bounds\n"); 
        return(1);
    }
    printf("\n");
    for(i=0;i<len;i++){
        for(j=0;j<len;j++){
           printf("*");
        }printf("\n");
    }return(0);
}

