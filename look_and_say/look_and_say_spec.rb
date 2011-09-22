require 'test/unit'
require 'look_and_say'

class LookAndSayTest < Test::Unit::TestCase

  def test_fails_on_non_numbers
    assert_raise(ArgumentError, "Should not allow strings with non-digit characters") do
      LookAndSay.new("foo")
    end    
  end

  def test_returns_same_value_if_next_is_not_called
    assert_equal "123454321", LookAndSay.new("123454321").to_s
  end
  
  def test_22_is_a_fixed_point
    assert_equal "22", LookAndSay.new("22").next.to_s
  end
  
  def test_1_returns_11
    assert_equal "11", LookAndSay.new("1").next.to_s
  end
  
  def test_111221_returns_312211
    assert_equal "312211", LookAndSay.new("111221").next.to_s
    
  end
  
  def test_1_returns_21_after_2_steps
    assert_equal "21", LookAndSay.new("1").next.next.to_s
  end
  
  def test_1_returns_1211_after_3_steps
    assert_equal "1211", LookAndSay.new("1").next.next.next.to_s
  end
  
end
