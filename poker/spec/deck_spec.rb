require "deck"

describe "Deck" do
  describe "Deck#initialize" do
    subject(:deck) { Deck.new }
    it "Creates 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "13 of each suite" do
      hearts = deck.cards.select { |card| card.suite == :heart }
      expect(hearts.length).to eq(13)
    end

    it "4 of each value" do
      jacks = deck.cards.select { |card| card.value == 11 }
      expect(jacks.length).to eq(4)
    end

    it "No duplicates" do
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe "Deck#take" do
    subject(:deck){ Deck.new }
    it "decrements count of cards" do
      expect(deck.cards.length).to eq(52)
      deck.take
      expect(deck.cards.length).to eq(51)
    end

    it "returns a card" do
      expect(deck.take).to be_a(Card)
    end
  end

  describe "Deck#shuffle!" do
    subject(:deck){ Deck.new }
    it "shuffles the deck" do
      before_shuffle = deck.render
      deck.shuffle!
      expect(deck.render).not_to eq(before_shuffle)
    end
  end
end
