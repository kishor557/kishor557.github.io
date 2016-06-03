## Print specified shape (Triangle, Square, Rectangle, Rhombus) with the given user input

class Shape

  def initialize
    input "1. Triangle\n"
    input "2. Square\n"
    input "3. Rectangle\n"
    input "4. Rhombus\n"
    input "5. All Above\n"
    input "Which shape you want to input?\t"
    @option = gets.chomp.to_i
    input "Enter character you want to use?\t"
    @ch = gets.chomp
    choose()
  end
  
  def input text
    print "\e[31m#{text}\e[0m"
  end

  def display text
    print "\e[32m#{text}\e[0m"
  end
  
  def num_chars
    input "Max number of characters?\t"
    @count = gets.chomp.to_i
  end
  
  def choose
    case @option
      when 1 
        num_chars;
        triangle;
      when 2 
          num_chars;
          square;
      when 3 then rectangle;
      when 4 
          num_chars;
          rhombus;
      when 5
         num_chars;
         triangle;
         square;
         rhombus;
         rectangle;
    end
  end
  
  def triangle
    puts "\n\n #####  Printing Triangle... ##### \n\n"
    for i in 1..@count
      (@count - i).times { display " "; }
      for j in 1..i
        display "#{@ch} "
      end
      puts
    end
    puts "\n\n #####  Done ##### \n\n"
  end
  
  def square
   puts "\n\n #####  Printing Square... ##### \n\n"
   for i in 1..@count
    for j in 1..@count
     display " #{@ch} "
    end
    puts
   end
   puts "\n\n #####  Done ##### \n\n"
  end

  def rectangle
    input "Enter number of characters horizontally\t:\t"
    @cols = gets.chomp.to_i
    input "Enter number of characters vertically\t:\t"
    @rows = gets.chomp.to_i
    puts "\n\n #####  Printing Square... ##### \n\n"
    for i in 1..@rows
      for j in 1..@cols
        display " #{@ch} "
      end
      puts
    end
    puts "\n\n #####  Done ##### \n\n"
  end

  def rhombus
    puts "\n\n #####  Printing Rhombus... ##### \n\n"
    for i in 1..@count
      (@count - i).times { display " "; }
      for j in 1..i
        display "#{@ch} "
      end
      puts
    end
    for i in 1...@count
      i.times { display " "; }
      for j in 1..(@count - i)
        display "#{@ch} "
      end
      puts
    end
    puts "\n\n #####  Done ##### \n\n"
  end  
end

obj = Shape.new
