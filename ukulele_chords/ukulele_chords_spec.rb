require 'test/unit'
require_relative 'ukulele_chords'
begin; require 'turn'; rescue LoadError; end

class UkuleleChordsSpec < Test::Unit::TestCase

  ######################
  #                    #
  # Ukulele#fingerings #
  #                    #
  ######################
  
  def test_fingerings_returns_standard_c_chord_fingering
    # C major chord = C - E - G = 0, 4, 7
    
    # 0 on the G string = G
    # 0 on the C string = C
    # 0 on the E string = E
    # 3 on the A string = C (raised one octave)
    
    u = Ukulele.new
    fingerings = u.fingerings([0, 4, 7]).sort
    assert_equal [0, 0, 0, 3], fingerings.first
  end
  
  def test_fingerings_returns_6_possible_c_chord_fingerings
    u = Ukulele.new
    fingerings = u.fingerings([0, 4, 7])
    assert_equal 6, fingerings.length
  end
  
end
