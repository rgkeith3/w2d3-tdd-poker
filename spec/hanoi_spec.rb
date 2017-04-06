require "hanoi"

describe "Hanoi" do
  subject(:hanoi){ Hanoi.new }
  describe "Hanoi#initialize" do
    subject(:hanoi){ Hanoi.new }

    it "Initializes w/ 3 towers" do
      expect(hanoi.towers.length).to eq(3)
    end

    it "First tower has three elements" do
      expect(hanoi.towers[0].length).to eq(3)
    end

    it "Other towers empty?" do
      expect(hanoi.towers[1]).to be_empty
      expect(hanoi.towers[2]).to be_empty
    end
  end

  describe "Hanoi#move" do
    it "Raises error if out of bounds movements" do
      expect{ hanoi.move(0,4) }.to raise_error(ArgumentError)
    end

    it "Moves piece correctly" do
      hanoi.move(0,2)
      expect(hanoi.towers).to eq([[3,2],[],[1]])
    end

    it "Raises an error if invalid move" do
      expect{ hanoi.move(0,4) }.to raise_error(ArgumentError)
      expect{ hanoi.move(1,2) }.to raise_error(ArgumentError)
      hanoi.move(0,2)
      expect{ hanoi.move(0,2) }.to raise_error(ArgumentError)
    end
  end

  describe "Hanoi#won?" do

    it "checks if not won" do
      hanoi = Hanoi.new
      expect(hanoi.won?).to be false
    end

    it "checks if all disks at two" do
      hanoi = Hanoi.new([[],[],[3,2,1]])
      expect(hanoi.won?).to be true
    end
  end
end
