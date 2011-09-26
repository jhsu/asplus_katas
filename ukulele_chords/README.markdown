### Ukulele Chords

The Ukulele is a 4-stringed musical instrument.  Like guitars, each string is tuned to a different note, and the strings are held down at different points along a fretboard to make a string play different notes.

The Ionian Scale that most western music uses contains 12 notes, each separated by half-steps.  For this kata, we'll call them `[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.  Ukuleles are usually tuned to G - C - E - A, but for this task we'll call them 7 - 0 - 4 - 9.  Each location on the fretboard is one half step higher, or +1 numerically.

Notes that are 12 points above each other are said to be the same note, separated by an octave.

The purpose of this task is to determine where on the fretboard the fingers must be held, to play different chords.

### Code Kata

This kata contains two files: `ukulele_chords.rb` and `ukulele_chords_spec.rb`.  `ukulele_chords.rb` defines a class, `Ukulele`, which contains one method: `fingerings`.  Your task is to implement this method, so that when you run:

    ruby ukulele_chords_spec.rb

all of the tests it contains pass.

The tests will pass in to the `fingerings` method an array of notes (for instance, `[0, 4, 7]`).  The method expects to receive back an array of fingerings that will play that chord.  A fingering is an array of 4 integers in (0..12), corresponding to positions on the fretboard for each of the four strings.

In order for a fingering to play a chord, the following must be satisfied:

1. Each of the notes in the chord (modulus 12) must be played on at least one string
2. No string can play a note not in that chord.
3. All fingerings actually on the fretboard (ie, non-0) must be within at most 4 positions from each other.
4. The 4 played notes are no more than 1 octave apart.
5. *Is this sufficient?*