require 'test/unit'
require 'bowling'

class BowlingTest < Test::Unit::TestCase

  def test_invalid_game_throws_an_exception
    assert_raise(Bowling::GameTooShort, "Should not accept an invalid game") do
      Bowling.new("X" * 10)
    end    
  end
  
  def test_gutterball_game_is_worth_0
    b = Bowling.new("-" * 20)
    assert_equal 0, b.score
  end
  
  def test_perfect_game_is_worth_300
    b = Bowling.new("X" * 12)
    assert_equal 300, b.score
  end
  
  def test_no_spares_is_worth_90
    b = Bowling.new("9-" * 10)
    assert_equal 90, b.score
  end
  
  def test_sample_game_is_worth_168
    b = Bowling.new("X7/729/XXX236/7/3")
    assert_equal 168, b.score
  end
  
end
