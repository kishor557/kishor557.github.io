require 'active_support/inflector'
require 'benchmark'  

class CurrencyChange

  # Class Constant
  Currencies = {
              "quarter" => 25,
              "dime"    => 10,
              "nickel"  => 5,
              "penny"   => 1
             }

  # initializer method  
  def initialize
    @h = Hash.new(0)
    @i = 0
    read_input
  end
  
  # return the change for the given number
  def change_for(n)
    keys = Currencies.keys                          
    currency = Currencies[keys[@i]]                 
    count = n / currency                            
    remaining = n - (count * currency)              
    @h[keys[@i].pluralize] = count                 
    @i += 1                                        
    return change_for(remaining) if remaining > 0  
    @h.delete_if {|k,v| v == 0 }                   
    puts @h
  end

  # read user input
  def read_input
    begin
      puts "Enter Number:"
      num = gets.strip.to_i
      raise "Please enter Non-negative amount" if num < 0    
      change_for(num)  
    rescue => e
      puts e.message
      retry
    end
  end

end

puts Benchmark.measure {
# create an object for the class
a = CurrencyChange.new
}
