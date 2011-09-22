### Look and Say Sequence

In mathematics, the look-and-say sequence is the sequence of integers beginning as follows:

    1, 11, 21, 1211, 111221, 312211, 13112221, 1113213211, ...

To generate a member of the sequence from the previous member, read off the digits of the previous member, counting the number of digits in groups of the same digit. For example:

* 1 is read off as "one 1" or 11.
* 11 is read off as "two 1s" or 21.
* 21 is read off as "one 2, then one 1" or 1211.
* 1211 is read off as "one 1, then one 2, then two 1s" or 111221.
* 111221 is read off as "three 1s, then two 2s, then one 1" or 312211.

The idea is similar to that of run-length encoding.

### Code Kata

This kata contains two files: `look_and_say.rb` and `look_and_say_spec.rb`.  `look_and_say.rb` defines a class `LookAndSay`, with three methods: `initialize`, `next`, and `to_s`.  Your task is to implement these three methods, so that when you run

    ruby look_and_say_spec.rb
    
all of the tests it contains pass.

*Description taken from [Wikipedia](http://en.wikipedia.org/wiki/Look-and-say_sequence).*