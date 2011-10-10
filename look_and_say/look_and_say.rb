class LookAndSay
  
  def initialize(string)
    @string = string.to_s
    raise ArgumentError if string =~ /\D/
  end

  def next
    @string = @string.scan(/(\d)(\1*)/).map {|number, repeated|
      count = (number + repeated).length
      "#{count}#{number}"
    }.join('')
    self
  end

  def to_s
    @string
  end
  
end
