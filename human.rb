# Represent a player as human
# Author :: Phu Binh Dang
class Human
  attr_reader :symbol_num, :symbol_code_num, :correct_guess
  def initialize(symbol_num, symbol_code_num)
    @symbols = (1..symbol_num).to_a
    @symbol_code_num = symbol_code_num
    @symbol_num = symbol_num
    @code = []
    @guess = nil
    @correct_guess = false
  end
  # create valid code base on game settings(number and validation of symbols)
  def generate_code
    # print "symbols : ", @symbols
    puts "Using blank character in your code to separate symbols, e.g. 1 2 3 4 5 6"
    begin
    print "enter your code: "
    @code = gets.chomp.to_s.delete("^1-8 ").split(" ").map(&:to_i)  
      # print "code: ", @code, "\n"
      # puts "length: #{@code.size}"
    end until @code.size == symbol_code_num && custom_include?(@code)
  end
  #give a valid black and white hits out
  def check_guess(guess)
    print "black hit(s): "
    black_hits = gets.chomp.to_i
    print "white hit(s): "
    white_hits = gets.chomp.to_i
    @correct_guess = true if black_hits == @symbol_code_num && white_hits == 0
    return [black_hits,white_hits]
  end
  # make a valid guess base on game settings(number and validation of symbols)
  def make_guess
    puts "Using blank character in your guess to separate symbols, e.g. 1 2 3 4"
    begin
      print "enter your guess: "
      @guess = gets.chomp.to_s.delete("^1-8 ").split(" ").map(&:to_i) 
      # print "guess: ", @guess, "\n"
      # puts "length: #{@guess.size}"
    end until @guess.size == symbol_code_num && custom_include?(@guess)
  end
  # for human this method is just a place holder
  def analyse_tip(tip)
    #do nothing
  end
  # help method checks for validation of symbols in guess and code
  def custom_include?(array)
    return false if array.empty?
    include = true
    array.each do |e|
      if  !symbols.include?(e)
        include = false
        break
      end
    end
    return include
  end
  def symbols
    @symbols.clone
  end
  def code
    @code.clone
  end
  def guess
    @guess.clone
  end
  private :custom_include?
end
