class Hanoi

  attr_accessor :towers
  def initialize grid=[[3,2,1],[],[]]
    @towers = grid
  end

  def move from, to
    if from.between?(0,2) && to.between?(0,2) &&
      !@towers[from][-1].nil? &&
      (@towers[to][-1].nil? || @towers[to][-1] > @towers[from][-1])

      towers[to] << towers[from].pop
    else
      raise ArgumentError.new("Invalid move")
    end
  end

  def won?
    @towers[2] == [3,2,1]
  end
end
