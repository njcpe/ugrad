/* Doubly Linked List implementation */
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define max(a,b)                                \
  ({ __typeof__ (a) _a = (a);                   \
    __typeof__ (b) _b = (b);                    \
    _a > _b ? _a : _b; })

//DIST FCNS
double uniform_rv(int lo, int hi){
  return((double)lo+rand()/(RAND_MAX/((double)hi-(double)lo)+1));
}

//Does not work, do not use
int bernoulli_rv(){
  int inc = 0;
  if(uniform_rv(0,1)< 2){return inc;}
  inc++;
}
//END DIST FCNS

typedef struct DNode {                      // doubly linked list node
  int  aTime;             //arrival time
	int    fSize;             // file size
  int    TSLS;
	struct DNode* prev;                   // previous node in list
	struct DNode* next;                   // next node in list
}DNode;

DNode* head;
DNode* tail;

// insert new node before v
void addPkt(DNode* v, int arrivalT, int sizeF) {
	DNode* u = (DNode*)malloc(sizeof(DNode));       // create a new node
	u->aTime = arrivalT;
	u->fSize = sizeF;
  u->TSLS = 1;
	u->next = v;                // link u in between v
	u->prev = v->prev;              // ...and v->prev
	v->prev->next = u;
	v->prev = u;
}

void addFront(int arrivalT, int sizeF)  // add to front of list
{
	addPkt(head->next, arrivalT, sizeF);
}

void addBack(int arrivalT, int sizeF)   // add to back of list
{
	addPkt(tail, arrivalT, sizeF);
}

void Remove(DNode* v) {     // remove node v
	DNode* u = v->prev;                  // predecessor
	DNode* w = v->next;                  // successor
	u->next = w;                         // unlink v from list
	w->prev = u;
	free(v);
}

void removeFront()
{
	Remove(head->next);
}

void removeBack()
{
	Remove(tail->prev);
}

int empty(){        // is list empty?
	return (head->next == tail);
}

//Prints all the elements in linked list in forward traversal order
void Print() {
  DNode* temp = head->next;
  if(empty()) return; // empty list, exit
  printf("Forward:\n");
  while(temp != tail){
    printf("%d\t%d\t%d\n",temp->aTime, temp->fSize, temp->TSLS);
    temp = temp->next;
  }
  printf("\n");
}

//Prints all elements in linked list in reverse traversal order.
void ReversePrint() {
  DNode* temp = tail->prev;
  if(empty()) return; // empty list, exit
  // Traversing backward using prev pointer
  printf("Reverse:\n");
  while(temp != head) {
    printf("%d\t%d\t%d\n",temp->aTime, temp->fSize, temp->TSLS);
  temp = temp->prev;
  }
  printf("\n");
}

/* int service(){ */
/*   DNode* temp = tail->prev; */
/*   if(temp->fSize == 0){ */
/*     int tempDelay = temp->TSLS; */
/*     printf("\nDELAY: %d",tempDelay); */
/*     removeBack(); */
/*     //    printf("\nremoved"); */
/*     return tempDelay; */
/*   }else{ */
/*     temp->fSize--; */
/*     //temp->TSLS = 0; */
/*     //printf("\ndecrement\n"); */
/*     return 0; */
/*   } */
/* } */

void incDelay(){
  //increment all Pkts TSLS
  DNode* temp = head->next;
  while (temp != tail)
    {
      temp->TSLS = temp->TSLS + 1;
      temp = temp->next;
    }
}

void killQueue(){
  while(empty() == 0){
    removeFront();
  }
}


int main() {
  /*Driver code to test the implementation*/
  FILE* fp;
  int i;
  int T = 10000;
  double lambda = 0.0;
  double mu = 0.5;
  int A = 0;
  int S = 0;
  int M = 5;
  int D;
  int fileSize = 1;
  double D_avg;
  int srvc = 1;
  int pktCount = 0;

  //Create the Empty List
  head = (DNode*)malloc(sizeof(DNode));
  tail = (DNode*)malloc(sizeof(DNode));
  head->prev = NULL;
  head->next = tail;
  tail->prev = head;
  tail->next = NULL;

  //Begin Sim
  srand(time(NULL));
  //fp = fopen("GG1.txt","w+");
  //fp = fopen("GD1.txt","w+");
  //fp = fopen("GX1.txt","w+");
  fp = fopen("RR_GG1.txt","w+");
  //fp = fopen("RR_GD1.txt","w+");
  //fp = fopen("RR_GX1.txt","w+");

  for(lambda=0.01;lambda<0.50;lambda+=0.01){
    if(empty() == 0){
      killQueue();
    }
    pktCount = 0;
    for(i=0;i<T;i++){
      //if there is an arrival
      if(uniform_rv(0,1) < lambda){
        //Determine Packet Size

        //GEO
        fileSize = 1; //fileSize is at least 1
        while(uniform_rv(0,1) < mu){
          fileSize++; //geometric distribution
        }

        //D
        //fileSize = 2;

        //X
        //fileSize = M * (uniform_rv(0,1) < ((1 / mu) - 1)/(M - 1));
        //if(fileSize <= 0)
        //fileSize = 1;

        //Add Packet
        addFront(T,fileSize);

      }
      //FCFS Servicing
      /*
      if(srvc == 1 && empty() == 0){
        //if tail pkt is of size 0, incr pktCount, D_avg, and remove packet
        if(tail->prev->fSize == 0){
          pktCount++;
          D_avg =+ tail->prev->TSLS;
          //printf("\nDELAY: %.3f",D_avg);
          removeBack();
        }else{
          //otherwise decrement size
          tail->prev->fSize--; 
        }
      }
      */
      //RR Servicing
      //Look for Highest TSLS
      DNode* temp1 = head;
      DNode* maxTSLS = head;
      if (srvc == 1 && empty() == 0) {
        while(temp1 != tail){
          if (temp1->TSLS > maxTSLS->TSLS)
            maxTSLS = temp1;
          temp1 = temp1->next;
        }
        //Decrement Pckt Size, Reset TSLS
        maxTSLS->fSize--;
        maxTSLS->TSLS = 0;
        //remove if necessary, add delay to D_avg
        if (maxTSLS->fSize <= 0) {
          pktCount++;
          int temp = max(T - (maxTSLS->aTime), 0);
          if (temp < 0) {
            temp = 0;
          }
          D_avg =+ temp;
          Remove(maxTSLS);
        }
      }
      //flip servicing, for rate = .5
      //increment delay
      srvc = !srvc;
      incDelay();
    }
    D_avg /= (double)pktCount;
    fprintf(fp,"%.3f, %.3f\n",lambda, D_avg);
  }
  fclose(fp);
}
