/*
Implements a Geo/Geo/1 Queue for analysis
of mean delay performance ELE408 HW3_Q1 
*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define max(a,b)				\
  ({ __typeof__ (a) _a = (a);			\
    __typeof__ (b) _b = (b);			\
    _a > _b ? _a : _b; }

/*Types */
typedef struct DNode{
  //data
  double aTime; //arrival time
  int sTime;    //TSLS var
  int fSize;    //packet size
  //functional
  struct DNode* prev; 
  struct DNode* next;
}File;

typedef struct Queue{
  File* head;
  File* tail;
  }Queue;

		 
/*Functions*/
int IsEmpty(Queue* myQueue){
  if(myQueue != NULL){
    //printf("yeet");
    return(myQueue->head->next == myQueue->tail);
  }
  printf("Queue pointer is null");
}
Queue* AddFile(Queue* myQueue, double time, int size){
  File* u = (File*)malloc(sizeof(File));
  u->aTime = time;
  u->fSize = size;
  u->sTime = 0;
  File* Lastfile = (File*)malloc(sizeof(File));
  Lastfile = myQueue->tail;

  u->next = Lastfile;
  u->prev = Lastfile->prev;

  Lastfile->prev->next = u;
  Lastfile->prev = u;

  return myQueue;
}

Queue* RemoveFile(Queue* myQueue, File* f){
  File* u = (File*)malloc(sizeof(File));
  File* v = (File*)malloc(sizeof(File));
  u=f->prev;
  v=f->next;

  u->next=f->next;
  v->prev=f->prev;
  free(f);

  return myQueue;
}

Queue* RemoveFirst(Queue* myQueue){
  myQueue = RemoveFile(myQueue, myQueue->head->next);
  return myQueue;
}


double uniform_rv(int lo, int hi){
  return((double)lo+rand()/(RAND_MAX/((double)hi-(double)lo)+1));
}



int main(int argc, char* argv[]){
  //FILE* fp;
  int i;
  int T = 1000000;
  double lambda = 0.0;
  double mu = 0.5;
  Queue* Q_sim;
  //int Q;
  //double Q_avg;
  srand(time(NULL));
  
  //Instantiate Queue
  struct File* head = (File*)malloc(sizeof(File));
  Q_sim->head = Head;
  //IsEmpty(Q_sim);
  //Set up sim time

  //Set up arrival handling

  //Set up Servicing
  
  
  //fclose(fp);
}
