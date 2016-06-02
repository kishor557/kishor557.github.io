//C hello world example
#include <stdio.h>
 
int main()
{
   int n, option;
   printf("Enter Number \t:\t");
   scanf("%d", &n);
   printf("\nYou have entered\t:\t %d", n);
   printf("\nEnter your option to check the number:\n");
   printf("\n1. PRIME NUMBER OR NOT");
   printf("\n2. EVEN/ODD NUMBER");
   printf("\n3. ABOVE ALL\n");
   scanf("%d", &option);
   choice(option, n);
  return 0;
}

int choice(int option, int n) {
  printf("\nYou have entered option: %d\n", option);
  switch(option) {
    case 1 :
      prime(n);
    case 2 :
      even(n);
    case 3 :
      prime(n);
      even(n); 
  }
}

int prime(int n) {
    int i, f = 1;
    for(i = 2; i <= n-1; i++) {
      if (n % i == 0) {
        f = 0; break;
      }
    }
    if (f == 1) {
      printf("%d is a prime number!\n", n);
    }   
    else if (f == 0) {
      printf("%d is not a prime number!\n", n);
    }
}

int even(int n) {
  if (n % 2 == 0) {
    printf("%d is an even number!\n", n);
  }else{
    printf("%d is an odd number!\n" , n);   
  }
}


// open terminal
// gcc number.c -o number
// ./number
