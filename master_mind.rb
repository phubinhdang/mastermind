require_relative 'computer'
require_relative 'human'
class MasterMind
  attr_reader :symbol_num, :symbol_code_num, :guess_count
  def initialize
    @code_maker
    @code_breaker
    @guess_limit = 10
    @guess_count = 0
    @symbol_num
    @symbol_code_num
  end
  def introduce
    print "Welcome to Mastermind"
  end
  def setting
    set_symbol
    set_player
  end
  def run_game
    @code_maker.generate_code
    printf("%9s |","Code")
    @symbol_code_num.times{ print " * "}
    puts
    begin
      @code_breaker.make_guess
      @guess_count +=1
      #printf("%9s | %s\n","Code",@code_maker.code.join(', '))
      printf("%5s %2d. | %s\n","Guess", @guess_count, @code_breaker.guess.join(', '))
      tip = @code_maker.check_guess(@code_breaker.guess)
      printf("%d black, %d white hit(s)\n", tip[0], tip[1])
      @code_breaker.analyse_tip(tip)
    end until @code_maker.correct_guess || @guess_count >= @guess_limit

    if @code_maker.correct_guess
      20.times{print "*"}
      puts
      printf("%9s | %s\n","Code",@code_maker.code.join(', '))
      print "\nCongratulation! The code is broken\n"
    else
      20.times{print "*"}
      puts "\nSorry, you have only #{@guess_limit} attempts. The code wasn't broken\n"
    end
  end
  def set_symbol
    begin
    print "How many symbols( numbers) do you want to play with ? 6 or 8 : "
      @symbol_num = gets.chomp.to_i
    end until @symbol_num == 6 || @symbol_num == 8
    begin
    print "How many symbols will the code contain (repetition is allowed) ? 4 or 6: "
      @symbol_code_num = gets.chomp.to_i
    end until @symbol_code_num == 4 || @symbol_code_num == 6
  # puts "#{symbol_num} symbols : #{} is allowed and code will contain #{symbol_code_num} symbols"
    printf("%d %s: %s %s.\n",symbol_num,"following symbols ",(1..symbol_num).to_a.join(", "),"are allowed")
  end
  def set_player
    code_maker_choice = 0
    code_breaker_choice = 0
    begin
    puts "who will play as code maker ?"
    print " (1) Computer (2) Human : "
    code_maker_choice = gets.chomp.to_i
    end until code_maker_choice == 1 || code_maker_choice == 2
    begin
    puts "who will play as code breaker ?"
    print " (1) Computer (2) Human : "
    code_breaker_choice = gets.chomp.to_i
    end until code_breaker_choice == 1 || code_breaker_choice == 2
    #create coder maker and coder breaker base on users choice
    case code_maker_choice
    when 1
      @code_maker = Computer.new(symbol_num,symbol_code_num)
    else
      @code_maker = Human.new(symbol_num,symbol_code_num)
    end
    case code_breaker_choice
    when 1
      @code_breaker = Computer.new(symbol_num,symbol_code_num)
    else
      @code_breaker = Human.new(symbol_num,symbol_code_num)
    end
  end
end

