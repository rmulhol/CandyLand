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
      expect(new_deck.make_pink_cards.length).to eq(8)
    end

    it "gives each card a 'pink' string" do
      deck_with_pink_cards = new_deck.make_pink_cards
      expect(deck_with_pink_cards.map { |card| card.include? "pink" }).not_to include(false)
    end
  end
end