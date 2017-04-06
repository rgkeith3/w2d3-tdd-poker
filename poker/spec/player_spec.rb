require "player"

describe "Player" do
  describe "Player#initialize" do
    subject(:player) { Player.new("Grey", 0) }
    it "Initializes with a name" do
      expect(player.name).to eq("Grey")
    end

    it "Initializes with id" do
      expect(player.id).to eq(0)
    end

    it "Initializes with a hand" do
      expect(player.hand).to be_a(Hand)
    end
  end
end
