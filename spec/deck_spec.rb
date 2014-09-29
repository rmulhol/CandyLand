require 'deck'

describe Deck do
  let(:new_deck) { described_class.new }
  let(:pink_cards) { new_deck.make_4_pink_cards }

  describe "#make_56_spaces" do
    it " makes an array with 56 spaces" do
      expect(new_deck.make_56_spaces.length).to eq(56)
    end
  end

  describe "#make_4_pink_cards" do
    it "makes 4 cards" do
      expect(pink_cards.length).to eq(4)
    end

    it "gives each card a 'pink' string" do
      test_cards_are_pink = pink_cards.map { |card| card.include? "pink" }
      
      expect(test_cards_are_pink).not_to include(false)
    end
  end

  describe "#give_4_pink_cards_candycanes" do
    let(:includes_candycanes) { new_deck.give_4_pink_cards_candycanes }
    
    it "outputs an array with 4 cards" do
      test_four_cards = includes_candycanes.length

      expect(test_four_cards).to eq(4)
    end

    it "outputs an array containing only pink cards" do
      test_cards_are_pink = includes_candycanes.map { |card| card.include? "pink" }

      expect(test_cards_are_pink).not_to include(false)
    end

    it "outputs an array where every element contains 'candycane'" do
      test_cards_include_candycanes = includes_candycanes.map { |card| card.include? "candycane" }

      expect(test_cards_include_candycanes).not_to include(false)
    end
  end

  describe "give_4_pink_cards_gumdrops" do
    let(:includes_gumdrops) { new_deck.give_4_pink_cards_gumdrops }

    it "outputs an array with 4 cards" do
      test_four_cards = includes_gumdrops.length

      expect(test_four_cards).to eq(4)
    end

    it "outputs an array containing only pink cards" do
      test_cards_are_pink = includes_gumdrops.map { |card| card.include? "pink" }

      expect(test_cards_are_pink).not_to include(false)
    end

    it "outputs an array where every element contains 'gumdrop'" do
      test_cards_include_gumdrops = includes_gumdrops.map { |card| card.include? "gumdrop" }

      expect(test_cards_include_gumdrops).not_to include(false)
    end
  end

  describe "add_reverse_to_2_cards" do
    let(:four_cards) { Array.new(4) { [] } }
    let(:test_add_reverse_output) { new_deck.add_reverse_to_2_cards(four_cards) }
    
    it "outputs an array with 4 cards" do
      test_output_length = test_add_reverse_output.length

      expect(test_output_length).to eq(4)
    end

    it "adds 'reverse' to 2 of the cards" do
      cards_with_reverse = test_add_reverse_output.map { |card| card.include? "reverse" }
      count_of_cards_with_reverse = cards_with_reverse.count(true)

      expect(count_of_cards_with_reverse).to eq(2)
    end
  end

  describe "#make_5_colors" do
    it "creates an array with 5 non-pink colors" do
      colors = ["yellow", "blue", "green", "red", "orange"]

      expect(new_deck.make_5_colors).to eq(colors)
    end
  end

  describe "#give_non_pink_spaces_a_color" do
    let(:blank_cards) { new_deck.make_56_spaces }
    let(:non_pink_cards) { new_deck.give_non_pink_spaces_a_color(blank_cards) }

    it "makes an array with 56 spaces" do
      expect(non_pink_cards.length).to eq(56)
    end

    it "fills every empty array" do
      no_empty_arrays = non_pink_cards.map { |card| card.empty? }

      expect(no_empty_arrays).not_to include(true)
    end

    it "fills every empty array_with_a_color" do
      colors = new_deck.make_5_colors
      test_cards_have_colors = non_pink_cards.map { |card| colors.include? card[0] }
      
      expect(test_cards_have_colors).not_to include(false)
    end

    it "disperses a variety of colors" do
      array_index_counter = 0
      includes_variance = []
      until array_index_counter >= 54
        card = non_pink_cards[array_index_counter] 
        next_card = non_pink_cards[array_index_counter + 1]
        card_comparison = card != next_card
        includes_variance << card_comparison
        array_index_counter += 1
      end

      expect(includes_variance).to include(true)
    end
  end
end
