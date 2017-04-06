class Card
  attr_reader :value, :suite
  def initialize value, suite
    @value = value
    @suite = suite
  end

  def render
    if(@value < 9)
      (@value + 2).to_sym
    else
      hash = {
        9 => "J",
        10 => "Q",
        11 => "K",
        12 => "A"
      }
      hash[@value].to_sym
    end
  end
end
