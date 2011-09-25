require 'test/unit'
require 'look_and_say'

class LookAndSayTest < Test::Unit::TestCase

  #########################
  #                       #
  # LookAndSay#initialize #
  #                       #
  #########################
  
  def test_initialize_fails_on_non_numbers
    assert_raise(ArgumentError, "Should not allow strings with non-digit characters") do
      LookAndSay.new("foo")
    end    
  end

  def test_initialize_stringifies_what_is_passed_in
    assert_nothing_raised(ArgumentError, "Should stringify what is passed in") do
      LookAndSay.new [1, 2, 3]
    end
  end
  
  ###################
  #                 #
  # LookAndSay#to_s #
  #                 #
  ###################
  
  def test_to_s_returns_a_string
    assert_kind_of String, LookAndSay.new("1234").to_s
  end
  
  def test_to_s_returns_same_string_value_if_next_is_not_called
    assert_equal "123454321", LookAndSay.new("123454321").to_s
  end
  
  ###################
  #                 #
  # LookAndSay#next #
  #                 #
  ###################
  
  def test_next_returns_a_look_and_say_object
    assert_kind_of LookAndSay, LookAndSay.new("1234").next
  end
  
  def test_1_returns_11
    assert_equal "11", LookAndSay.new("1").next.to_s
  end

  def test_1_returns_21_after_2_steps
    assert_equal "21", LookAndSay.new("1").next.next.to_s
  end
  
  def test_1_returns_1211_after_3_steps
    assert_equal "1211", LookAndSay.new("1").next.next.next.to_s
  end
  
  def test_22_is_a_fixed_point
    assert_equal "22", LookAndSay.new("22").next.to_s
  end
  
  def test_a_complicated_case
    assert_equal "11131432134114252442211311122322", LookAndSay.new("13422231111455442222113123322").next.to_s  
  end
  
end
