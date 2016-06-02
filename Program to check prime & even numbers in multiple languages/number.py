class Number:
  
  def __init__(self):
    print "Enter Number \t:\t"
    self.n = int(raw_input())
    print "\nYou have entered\t:\t", self.n
    print "\nEnter your option to check the number:"
    print "\n1. PRIME NUMBER OR NOT"
    print "2. EVEN/ODD NUMBER"
    print "3. ABOVE ALL"
    self.option = int(raw_input())
    self.choice()
  
  def choice(self):
    print "You have entered option: ", self.option
    if (self.option == 1) : self.prime()
    elif (self.option == 2) : self.even()
    elif (self.option == 3) : self.prime(); self.even();
    
  def prime(self):
    flag = 'true';
    for i in range(2, self.n-1):
      if (self.n % i == 0) : flag = 'false'; break;
    if flag == 'true' : print self.n, "is a prime number!"    
    elif flag == 'false' : print self.n, "is not a prime number!"

  
  def even(self):
    if (self.n % 2 == 0) : print self.n, "is an even number!";
    else :  print self.n, "is an odd number!";   
         
obj = Number()


# open a terminal and enter 'python number.py'
