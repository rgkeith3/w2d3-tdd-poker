require "card"

describe "Card" do
  describe "Card#initialize" do
    it "Sets (value, suite)" do
      card = Card.new(5, :heart)
      expect(card.value).to eq(5)
      expect(card.suite).to eq(:heart)
    end
  end
end
