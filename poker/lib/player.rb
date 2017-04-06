class Player
  attr_accessor :name, :id, :hand

  def initialize name, id
    @name = name
    @id = id
    @hand = Hand.new
  end
end
