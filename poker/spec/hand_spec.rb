require "hand"

describe "Hand" do
  describe "Hand#initialize" do
    subject(:hand) { Hand.new }
    it "Initializes as empty array" do
      expect(hand.cards).to eq([])
    end
  end

  describe "Hand#add" do
    subject(:hand) { Hand.new }
    it "Correctly adds card to hand" do
      card = Card.new(1,:heart)
      hand.add(card)
      expect(hand.cards.length).to eq(1)
      expect(hand.cards[0]).to eq(card)
    end
  end

  describe "Hand#discard" do
    let(:card_0) { double("card")}
    let(:card_1) { double("card")}
    let(:card_2) { double("card")}
    let(:card_3) { double("card")}
    let(:card_4) { double("card")}
    subject(:hand) { Hand.new [card_0, card_1, card_2, card_3, card_4] }

    it "Raises error if indices out of bounds" do
      expect{ hand.discard([5]) }.to raise_error(ArgumentError)
    end

    it "Raises error tries to discard more than 3" do
      expect{ hand.discard([1,2,3,4]) }.to raise_error(ArgumentError)
    end

    it "Correctly discards cards" do
      hand.discard([2])
      expect(hand.cards).to eq([card_0, card_1, card_3, card_4])
    end
  end

  describe "Hand#rank" do
    let(:card_0) { double("card")}
    let(:card_1) { double("card")}
    let(:card_2) { double("card")}
    let(:card_3) { double("card")}
    let(:card_4) { double("card")}
    subject(:hand) { Hand.new [card_0, card_1, card_2, card_3, card_4] }

    it "Raises error if indices out of bounds" do
      expect{ hand.discard([5]) }.to raise_error(ArgumentError)
    end

    it "Raises error tries to discard more than 3" do
      expect{ hand.discard([1,2,3,4]) }.to raise_error(ArgumentError)
    end

    it "Correctly discards cards" do
      hand.discard([2])
      expect(hand.cards).to eq([card_0, card_1, card_3, card_4])
    end
  end

  subject(:royal_flush) { Hand.new([
    Card.new(12,:heart),
    Card.new(8,:heart),
    Card.new(10,:heart),
    Card.new(9, :heart),
    Card.new(11, :heart)])}
  subject(:straight_flush) { Hand.new([
    Card.new(8, :heart),
    Card.new(5, :heart),
    Card.new(6, :heart),
    Card.new(4, :heart),
    Card.new(7, :heart)])}
  subject(:four_kind) { Hand.new([
    Card.new(9, :heart),
    Card.new(9, :spade),
    Card.new(9, :club),
    Card.new(5, :spade),
    Card.new(9, :diamond)])}
  subject(:full_house) { Hand.new([
    Card.new(9, :heart),
    Card.new(9, :spade),
    Card.new(9, :club),
    Card.new(5, :spade),
    Card.new(5, :diamond)])}
  subject(:flush) { Hand.new([
    Card.new(9, :heart),
    Card.new(7, :heart),
    Card.new(5, :heart),
    Card.new(3, :heart),
    Card.new(1, :heart)])}
  subject(:straight) { Hand.new([
    Card.new(5, :heart),
    Card.new(4, :club),
    Card.new(3, :heart),
    Card.new(2, :club),
    Card.new(1, :heart)])}
  subject(:triple) { Hand.new([
    Card.new(13, :heart),
    Card.new(13, :club),
    Card.new(13, :heart),
    Card.new(2, :club),
    Card.new(1, :heart)])}
  subject(:two_pair) { Hand.new([
    Card.new(13, :heart),
    Card.new(13, :club),
    Card.new(12, :heart),
    Card.new(12, :club),
    Card.new(1,  :heart)])}
  subject(:pair) { Hand.new([
    Card.new(13, :heart),
    Card.new(13, :club),
    Card.new(12, :heart),
    Card.new(11, :club),
    Card.new(9,  :heart)])}
  subject(:high_card_2) { Hand.new([
      Card.new(10, :heart),
      Card.new(7, :club),
      Card.new(5, :heart),
      Card.new(3, :heart),
      Card.new(1, :heart)])}
  subject(:high_card_1) { Hand.new([
      Card.new(10, :heart),
      Card.new(6, :club),
      Card.new(5, :heart),
      Card.new(3, :heart),
      Card.new(1, :heart)])}
  subject(:high_card) { Hand.new([
    Card.new(9, :heart),
    Card.new(7, :club),
    Card.new(5, :heart),
    Card.new(3, :heart),
    Card.new(1, :heart)])}

  describe "Hand#type returns the correct type of hand" do
    it "Correctly identifies a royal flush as a straight_flush" do
      expect(royal_flush.type).to eq(:straight_flush)
    end

    it "Correctly identifies a four of a kind" do
      expect(four_kind.type).to eq(:four_kind)
    end

    it "Correctly identifies full house" do
      expect(full_house.type).to eq(:full_house)
    end

    it "Correctly identifies a flush" do
      expect(flush.type).to eq(:flush)
    end

    it "Correctly identifies a straight" do
      expect(straight.type).to eq(:straight)
    end

    it "Correctly identifies triples" do
      expect(triple.type).to eq(:triple)
    end

    it "Correctly identifies a two pair" do
      expect(two_pair.type).to eq(:two_pair)
    end

    it "Correctly identifies a pair" do
      expect(pair.type).to eq(:pair)
    end

    it "Correctly identifies high card" do
      expect(high_card.type).to eq(:high_card)
    end
  end

  describe "Hand#rank" do
    it "Correctly ranks hands" do
      hands = [royal_flush, straight_flush, four_kind, full_house, flush, straight,
      triple, two_pair, pair, high_card]
      hands.each_cons(2) {|a, b| expect(a.rank > b.rank).to be true}
    end


    it "Correctly ranks high cards" do
       expect(high_card_2.rank > high_card.rank).to be true
       expect(high_card_2.rank > high_card_1.rank).to be true
    end
  end
end
