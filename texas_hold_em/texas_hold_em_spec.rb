require 'test/unit'
require 'texas_hold_em'

class TexasHoldEmTest < Test::Unit::TestCase

  def test_flush_beats_straight
    cards = "2D 4D 6D 7C 8C 9D 10D"
    assert_equal "Flush (10 high)", TexasHoldEm.new(cards).best_hand
  end
  
  def test_pick_correct_high_card_for_full_house
    cards = "AH AC 2D 2H 2C 5S 8S"
    assert_equal "Full House (2 high)", TexasHoldEm.new(cards).best_hand
  end
  
end
