
class LookAndSay
   
  def initialize(string)
    if(string.kind_of?(Array))
      @user_input = string.each { |x| x.to_s }   
    elsif(string.to_i.to_s == string)
      @user_input = string
    else
      raise ArgumentError, "Show not allow strings with non-digit characters"
    end
  end

  def next
    @user_input = @user_input.gsub(/(.)\1*/) {|s|  s.size.to_s + s[0]}    
    self
  end

  def to_s
    @user_input
  end
  
end
