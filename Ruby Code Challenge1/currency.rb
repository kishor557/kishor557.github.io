## ruby currency.rb

# we can change the key & value pairs
CURRENCY = { quarters: 25, dimes: 10, nickels: 5, pennies: 1 }

# global variables
$names = CURRENCY.keys         
$change = {}
$ind = 0

# main method to return the change for the given amount
def change_for(num)                           
  currency = CURRENCY[$names[$ind]]           
  
  count = num / currency                      
  bal = num - (count * currency)              
  $change[$names[$ind]] = count               
  $ind += 1                                   
  
  # calling the recursive function
  return change_for(bal) if bal > 0           
  
  $change.delete_if {|name, val| val == 0 }  
end


# useful to read input from the user
begin
  puts "Enter your input"
  amount = gets.to_i
  
  # validate the user input
  raise "Please enter non-negative amount"  if amount < 0    
  
  result = change_for(amount)  
  puts result

# exception handling 
rescue => err
  # display error 
  puts err.message
  
  # retry the operation in case of negative input 
  retry
end

