#test some methods of Human and Computer
require 'test/unit'
require_relative 'computer'
require_relative 'human'
class TestMastermind < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @com = Computer.new(6,4)
    @com.set_code([2,4,4,1])
    @human = Human.new(6,4)
  end
  def test_check_guess
    assert_equal([1,0], @com.check_guess([1,1,1,1]))
    assert_equal([0,2], @com.check_guess([1,2,2,2]))
    assert_equal([1,1], @com.check_guess([2,1,3,3]))
    assert_equal([2,2], @com.check_guess([2,4,1,4]))
    assert_equal([4,0], @com.check_guess([2,4,4,1]))
  end
  def test_custom_include?
    #allowed symbols are 1,2,3,4,5,6
    # negative
    assert_false(@human.send(:custom_include?,[])) #guess contain nothing
    assert_false(@human.send(:custom_include?,[1,2,7,8])) #not allowed symbol
    # positive
    assert_true(@human.send(:custom_include?,[1,2,3,4]))
    assert_true(@human.send(:custom_include?,[5,5,6,6]))
  end

  def teardown
    # Do nothing
  end
  # Fake test
  def test_fail

    # fail('Not implemented')
  end
end