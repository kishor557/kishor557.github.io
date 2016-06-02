import java.util.Scanner;


class Number {  
    public static void main(String args[]){  
       int n, option;
      Scanner input = new Scanner(System.in);

       System.out.println("Enter Number \t:\t");
       n = input.nextInt();
       System.out.println("\nYou have entered\t:\t"+ n);
       System.out.println("\nEnter your option to check the number:\n");
       System.out.println("\n1. PRIME NUMBER OR NOT");
       System.out.println("\n2. EVEN/ODD NUMBER");
       System.out.println("\n3. ABOVE ALL\n");
       option = input.nextInt();
       choice(option, n);
    } 
    
    public static int choice(int option, int n) {
      System.out.println("\nYou have entered option:\n" + option);
      switch(option) {
        case 1 :
          prime(n); break;
        case 2 :
          even(n); break;
        case 3 :
          prime(n);
          even(n);  break;
      }
      return 0;
    }
    
    public static int prime(int n) {
        int i, f = 1;
        for(i = 2; i <= n-1; i++) {
          if (n % i == 0) {
            f = 0; break;
          }
        }
        if (f == 1) {
          System.out.println(n + " is a prime number!\n");
        }   
        else if (f == 0) {
          System.out.println(n + " is not a prime number!\n");
        }
        return 0;
    }

    public static int even(int n) {
      if (n % 2 == 0) {
        System.out.println(n + " is an even number!\n");
      }else{
        System.out.println(n + " is an odd number!\n");   
      }
      return 0;
    }
}  

// Open terminal
// javac Number.java
// java Number
