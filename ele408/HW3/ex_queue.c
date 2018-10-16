
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


int bernoulli_rv(int mu){
  int inc = 0;
  if(uniform_rv(0,1)<(double)(1/mu)){return inc;}
  inc++;
}
//END DIST FCNS

typedef struct DNode {                      // doubly linked list node
  double aTime;             // node element value
	int    fSize;             // file size
  int    TSLS;
	struct DNode* prev;                   // previous node in list
	struct DNode* next;                   // next node in list
}DNode;

DNode* head;
DNode* tail;

// insert new node before v
void addPkt(DNode* v, double arrivalT, int sizeF) {
	DNode* u = (DNode*)malloc(sizeof(DNode));       // create a new node
	u->aTime = arrivalT;
	u->fSize = sizeF;
	u->next = v;                // link u in between v
	u->prev = v->prev;              // ...and v->prev
	v->prev->next = u;
	v->prev = u;
}

void addFront(double arrivalT, int sizeF)  // add to front of list
{
	addPkt(head->next, arrivalT, sizeF);
}

void addBack(double arrivalT, int sizeF)   // add to back of list
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
    printf("%.2f\t%d\n",temp->aTime, temp->fSize);
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
  printf("%.2f\t%d\n",temp->aTime, temp->fSize);
  temp = temp->prev;
  }
  printf("\n");
}

int main() {
  /*Driver code to test the implementation*/
  FILE* fp;
  int i;
  int T = 1000000;
  double lambda = 0.0;
  double mu = 0.5;
  int A = 0;
  int S = 0;
  int D;
  double D_avg;

  srand(time(NULL));
  fp = fopen("GG1.txt","w+");
  for(lambda=0.01;lambda<0.50;lambda+=0.01){
    for(i=0;i<T;i++){
      if(uniform_rv(0,1)<lambda){ //Geo arrival rate
        //addFront();
      }
      S = (uniform_rv(0,1)<mu);

    }
    D_avg /= (double)T;
    fprintf(fp,"%.3f, %.3f\n",lambda, D_avg);
  }
  fclose(fp);

  //Create the Empty List
  head = (DNode*)malloc(sizeof(DNode));
  tail = (DNode*)malloc(sizeof(DNode));
  head->prev = NULL;
  head->next = tail;
  tail->prev = head;
  tail->next = NULL;

  addBack(2.0,1);
  addBack(3.0,1);
  addFront(4.0,2);
  printf("%d\n",empty()); //empty check

  Print();
  ReversePrint();
  //InsertAtTail(4.1,3,1); Print(); ReversePrint();
  //AddPkt(6,2,1); /Print(); ReversePrint();
  //InsertAtTail(8.2,3,1); Print(); ReversePrint();
}
