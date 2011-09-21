require 'test/unit'

class LookAndSay
  
  def initialize(string)
    @current = string
  end

  def next
    self
  end

  def to_s
    @current
  end
  
end

class LookAndSayTest < Test::Unit::TestCase

  def test_fails_on_non_numbers
    assert_raise(ArgumentError, "Should not allow strings with non-digit characters") do
      LookAndSay.new("foo")
    end    
  end
  
  def test_22_is_a_fixed_point
    assert_equal LookAndSay.new("22").next.to_s, "22"
  end
  
  def test_1_returns_11
    assert_equal LookAndSay.new("1").next.to_s, "11"
  end

  def test_1_returns_21_after_2_steps
    assert_equal LookAndSay.new("1").next.next.to_s, "21"
  end
  
  def test_1_returns_1211_after_3_steps
    assert_equal LookAndSay.new("1").next.next.to_s, "1211"
  end
  
end
