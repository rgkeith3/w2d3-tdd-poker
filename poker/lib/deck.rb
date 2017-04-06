require_relative "card"

class Deck

  attr_accessor :cards

  def initialize
    suites = [:heart, :spade, :diamond, :club]
    @cards = []
    suites.each do |suite|
      (0..12).each {|value| @cards << Card.new(value, suite) }
    end
  end

  def take
    @cards.pop
  end

  def shuffle!
    @cards.shuffle!
  end

  def render
    @cards.map {|card| [card.value, card.suite]}
  end
end
