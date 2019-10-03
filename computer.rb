# Represent a player as computer
# Author :: Phu Binh Dang
class Computer
  attr_reader :correct_guess
  def initialize(symbol_num,symbol_code_num)
    @symbols = (1..symbol_num).to_a
    @symbol_code_num = symbol_code_num
    @code = []
    @correct_guess = false
    @guess = []
    @combis
  end
  #make a random code with a given symbols
  def generate_code
    @symbol_code_num.times{@code << symbols.sample}
    self
  end
  #check coder breakers guess and give black and white hits out
  def check_guess(guess)
    black_hits = 0
    white_hits = 0
    code = self.code  #so code in check white is the code after check black hits
    guess = guess.clone # important when 2 computers play with each other
                        #otherwise, it changes directly on guess => on combis => on symbols
    guess.each_with_index  do |g,i|
      if g == code[i]
        black_hits +=1
        guess[i] = nil # make change directly on guess and code
        code[i] = nil
      end
    end
    guess.each_index do |gi|
      code.each_index do |ci|
        if guess[gi] == code[ci] && guess[gi]
          white_hits +=1
          guess[gi] = nil  # make change directly on guess and code
          code[ci] = nil
        end
      end
    end
    @correct_guess = true if black_hits == @symbol_code_num && white_hits == 0
    return [black_hits,white_hits]
  end
  # choose a guess among the possible codes remaining
  def make_guess
    @combis ||= symbols.repeated_permutation(@symbol_code_num).to_a
    # puts @combis.size
    @code = @combis.first
    @guess = @combis.first
  end
  # delete all impossible codes of combinations array base on tip
  def analyse_tip(tip)
    #with_index in this case better than _index, bcs it will not change the original guess in combis by checking_guess
    @combis.each_with_index{ |combis_guess, i| @combis[i] = nil if check_guess(combis_guess) != tip }
    @combis.compact!
  end
  # just use for testing purpose
  def set_code(code)
    @code = code
  end
  def code
    @code.clone
  end
  def symbols
    @symbols.clone
  end
  def combis
    @combis.clone
  end
  def guess
    @guess.clone
  end
end
