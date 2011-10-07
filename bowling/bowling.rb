class Frame
  def initalize(throws)
    if(!throws.kind_of?(String))
      raise ArgumentError, "Frame parameter should be string"
    end
    @value = 10
    def value
      @value
    end    
  end
end

class Bowling
  
  class GameTooShort  < StandardError; end
  class GameTooLong   < StandardError; end
  class SpareTooEarly < StandardError; end
  class StrikeTooLate < StandardError; end
  class TooManyPins   < StandardError; end
  
  def initialize(throws)
    print throws
    @throw = throws
    @score = 0;
  end
  
  def score
    @score
  end
  
end
