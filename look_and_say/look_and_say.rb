class LookAndSay

  def initialize(string_or_array, implementation=:regex)
    string = (string_or_array.is_a? Array) ? string_or_array.join : string_or_array
    # digits only
    raise ArgumentError if string.match(/.*\D.*/)
    @current = string
    @implementation = implementation
  end

  def next
    case @implementation
      when :regex ; regex_solution;
      when :loop  ; loop_solution;
    end
    self
  end

  def to_s
    @current
  end

private
  def loop_solution
    same_digit_counter = 0
    next_string = ""
    @current.split(//).each_index do |i|
      same_digit_counter += 1
      if @current[i] != @current[i+1]
        next_string << "#{same_digit_counter}#{@current[i]}"
        same_digit_counter = 0
      end
    end
    @current = next_string
  end

  def regex_solution
    next_string = ""
    @current.scan(/(\d)(\1+)?/).each do |match_array|
      repeating_numbers = match_array.join
      next_string << "#{repeating_numbers.length}#{repeating_numbers[0]}"
    end
    @current = next_string
  end
end
