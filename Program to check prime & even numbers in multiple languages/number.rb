class Number
  def initialize
    print "Enter Number \t:\t"
    @n = gets.chomp.to_i
    puts "You have entered\t:\t#{@n}"
    print "\nEnter your option to check the number:"
    puts "\n1. PRIME NUMBER OR NOT"
    puts "2. EVEN/ODD NUMBER"
    puts "3. ABOVE ALL"
    @option = gets.chomp.to_i
    choice
  end
  
  def choice
    puts "You have entered option: #{@option}"
    case @option
      when 1 then prime;
      when 2 then even;
      when 3 
        prime;
        even;
    end
  end
  
  def prime
    flag = true;
    for i in 2..(@n-1)
      if (@n % i == 0)
        flag = false;
        break;
      end
    end
    if flag
      puts "#{@n} is a prime number!"    
    else
      puts "#{@n} is not a prime number!"
    end
  end
  
  def even
    if (@n % 2 == 0) 
      puts "#{@n} is an even number!"
    else
      puts "#{@n} is an odd number!"    
    end  
  end
end

obj = Number.new()

# open a terminal and enter 'ruby number.rb'
