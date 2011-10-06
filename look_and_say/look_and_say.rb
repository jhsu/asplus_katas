class LookAndSay
  
  def initialize(string_or_array)
    string = (string_or_array.is_a? Array) ? string_or_array.join : string_or_array
    # digits only
    raise ArgumentError if string.match(/.*\D.*/)
    @current = string
  end

  def next
    same_digit_counter = 0
    i = 0
    next_string = ""
    loop do
      break if @current[i].nil?

      same_digit_counter += 1
      if @current[i] != @current[i+1]
        next_string << "#{same_digit_counter}#{@current[i]}"
        same_digit_counter = 0
      end
      i +=1
    end
    @current = next_string
    self
  end

  def to_s
    @current
  end
end
