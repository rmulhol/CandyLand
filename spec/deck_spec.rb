require 'deck'

describe Deck do
  let(:new_deck) { described_class.new }
  
  describe "#make_56_spaces" do
    it " makes an array with 56 spaces" do
      expect(new_deck.make_56_spaces.length).to eq(56)
    end
  end

  describe "#make_pink_cards" do
    it "makes 8 cards" do
      pink_cards = new_deck.make_pink_cards
      expect(pink_cards.length).to eq(8)
    end

    it "gives each card a 'pink' string" do
      pink_cards = new_deck.make_pink_cards
      test_for_pink_inclusion = pink_cards.map { |card| card.include? "pink" }
      
      expect(test_for_pink_inclusion).not_to include(false)
    end
  end
end
