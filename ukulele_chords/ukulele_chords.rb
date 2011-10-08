class Ukulele
  STRING_COUNT = 4
  FRET_COUNT = 12
  STRING_NOTES = [7,0,4,9]
  NOTES_IN_OCTAVE = 12

  def fingerings(chord)
    # first make an array of pairs of [string_num, fret_num]
    # [0,0] to [3,12]
    possible_fingerings = []
    (0...STRING_COUNT).each do |string_num|
      (0..FRET_COUNT).each do |fret_num|
        possible_fingerings << [string_num, fret_num]
      end
    end

    voicings = []
    # now combine these pairs into all unique groups of 4
    voicings = possible_fingerings.combination(4).to_a

    voicings.keep_if do |voicing|
      # only keep combinations with all four strings
      voicing.sort.map(&:first).uniq.length == 4 and
      # only keep voicings with the right notes
      voicing.count{|pair| fret_in_chord? pair[0], pair[1], chord} == 4 and
      # only keep voicings within a 4-fret range
      voicing_within_4_frets? voicing and
      # all notes in the chord must be played
      voicing_includes_all_notes_in_chord? voicing, chord and
      # voicing must have a one octave range
      voicing_has_a_one_octave_range? voicing
    end

    # now change from array of pairs to array of frets
    voicings.map do |voicing|
      voicing.map(&:last)
    end
  end

  def print_fingerings(chord)
    fingerings(chord).each do |fingering|
      puts "  123456789tet"
      fingering.each_with_index do |fret, index|
        before_fret = "_" * (fret > 0 ? fret - 1 : 0)
        after_fret = "_" * (FRET_COUNT - fret)
        if fret == 0
          puts "#{number_to_letter_note(STRING_NOTES[index])}|" + "_" * 12
        else
          puts "#{number_to_letter_note(STRING_NOTES[index])}|#{before_fret}x#{after_fret}"
        end
      end
      puts
    end
  end

private
  def note_from_fret(string_num, fret_num)
    STRING_NOTES[string_num] + fret_num
  end
  def mod_note_from_fret(string_num, fret_num)
    note_from_fret(string_num, fret_num) % NOTES_IN_OCTAVE
  end
  def fret_in_chord?(string_num, fret_num, chord)
    chord.include? mod_note_from_fret(string_num, fret_num)
  end
  def voicing_within_4_frets?(voicing)
    frets = voicing.map(&:last)
    # only count non-zero frets
    frets.keep_if{|f| f > 0}
    (frets.max - frets.min) <= 4
  end
  def voicing_includes_all_notes_in_chord?(voicing, chord)
    notes = []
    voicing.each do |pair|
      notes << mod_note_from_fret(pair[0], pair[1])
    end
    notes.uniq.length == chord.length
  end
  def voicing_has_a_one_octave_range?(voicing)
    notes = []
    voicing.each do |pair|
      notes << note_from_fret(pair[0], pair[1])
    end
    (notes.max - notes.min) == NOTES_IN_OCTAVE
  end
  def number_to_letter_note(note_number)
    case note_number
    when 0; 'C';
    when 1; 'C#';
    when 2; 'D';
    when 3; 'D#';
    when 4; 'E';
    when 5; 'F';
    when 6; 'F#';
    when 7; 'G';
    when 8; 'G#';
    when 9; 'A';
    when 10; 'A#';
    when 11; 'B';
    end
  end
end
