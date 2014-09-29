require 'deck'

describe Deck do
  let(:new_deck) { described_class.new }
  let(:pink_cards) { new_deck.make_4_pink_cards }
  
  describe "#execute" do
    let(:finished_deck) { new_deck.execute }

    it "returns a deck with 64 cards" do
      deck_length = finished_deck.length

      expect(deck_length).to eq(64)
    end

    it "gives every card a color" do
      colors = ["yellow", "blue", "green", "red", "orange", "pink"]
      card_color_intersections = finished_deck.map { |card| card & colors }
      one_intersection_per_card = card_color_intersections.map { |card| card.length }
      proper_number_of_intersections = one_intersection_per_card.count(1)
      
      expect(proper_number_of_intersections).to eq(64)
    end

    it "contains 8 pink cards" do
      test_includes_pink_cards = finished_deck.map { |card| card.include? "pink" }
      number_of_pink_cards = test_includes_pink_cards.count(true)

      expect(number_of_pink_cards).to eq(8)
    end

    it "contains 4 cards with 'candycane'" do
      number_of_candycanes = finished_deck.count { |card| card.include? "candycane" }

      expect(number_of_candycanes).to eq(4)
    end

    it "contains 2 cards with 'candycane' and 'reverse'" do
      pink_cards = finished_deck.select { |card| card.include? "pink" }
      pink_candycanes = pink_cards.select { |card| card.include? "candycane" }
      number_of_reverse_candycanes = pink_candycanes.count { |card| card.include? "reverse" }
      
      expect(number_of_reverse_candycanes).to eq(2)
    end

    it "contains 4 cards with 'gumdrop'" do
      number_of_gumdrops = finished_deck.count { |card| card.include? "gumdrop" }

      expect(number_of_gumdrops).to eq(4)
    end

    it "contains 2 cards with 'gumdrop' and 'reverse'" do
      pink_cards = finished_deck.select { |card| card.include? "pink" }
      pink_gumdrops = pink_cards.select { |card| card.include? "gumdrop" }
      number_of_reverse_gumdrops = pink_gumdrops.count { |card| card.include? "reverse" }
      
      expect(number_of_reverse_gumdrops).to eq(2)
    end
  end

# describe "#make_56_spaces" do
#   it " makes an array with 56 spaces" do
#     expect(new_deck.make_56_spaces.length).to eq(56)
#   end
# end

# describe "#make_4_pink_cards" do
#   it "makes 4 cards" do
#     expect(pink_cards.length).to eq(4)
#   end

#   it "gives each card a 'pink' string" do
#     test_cards_are_pink = pink_cards.map { |card| card.include? "pink" }
#     
#     expect(test_cards_are_pink).not_to include(false)
#   end
# end

# describe "#give_4_pink_cards_candycanes" do
#   let(:includes_candycanes) { new_deck.give_4_pink_cards_candycanes }
#   
#   it "outputs an array with 4 cards" do
#     test_four_cards = includes_candycanes.length

#     expect(test_four_cards).to eq(4)
#   end

#   it "outputs an array containing only pink cards" do
#     test_cards_are_pink = includes_candycanes.map { |card| card.include? "pink" }

#     expect(test_cards_are_pink).not_to include(false)
#   end

#   it "outputs an array where every element contains 'candycane'" do
#     test_cards_include_candycanes = includes_candycanes.map { |card| card.include? "candycane" }

#     expect(test_cards_include_candycanes).not_to include(false)
#   end
# end

# describe "give_4_pink_cards_gumdrops" do
#   let(:includes_gumdrops) { new_deck.give_4_pink_cards_gumdrops }

#   it "outputs an array with 4 cards" do
#     test_four_cards = includes_gumdrops.length

#     expect(test_four_cards).to eq(4)
#   end

#   it "outputs an array containing only pink cards" do
#     test_cards_are_pink = includes_gumdrops.map { |card| card.include? "pink" }

#     expect(test_cards_are_pink).not_to include(false)
#   end

#   it "outputs an array where every element contains 'gumdrop'" do
#     test_cards_include_gumdrops = includes_gumdrops.map { |card| card.include? "gumdrop" }

#     expect(test_cards_include_gumdrops).not_to include(false)
#   end
# end

# describe "add_reverse_to_2_cards" do
#   let(:four_cards) { Array.new(4) { [] } }
#   let(:test_add_reverse_output) { new_deck.add_reverse_to_2_cards(four_cards) }
#   
#   it "outputs an array with 4 cards" do
#     test_output_length = test_add_reverse_output.length

#     expect(test_output_length).to eq(4)
#   end

#   it "adds 'reverse' to 2 of the cards" do
#     cards_with_reverse = test_add_reverse_output.map { |card| card.include? "reverse" }
#     count_of_cards_with_reverse = cards_with_reverse.count(true)

#     expect(count_of_cards_with_reverse).to eq(2)
#   end
# end

# describe "#make_5_colors" do
#   it "creates an array with 5 non-pink colors" do
#     colors = ["yellow", "blue", "green", "red", "orange"]

#     expect(new_deck.make_5_colors).to eq(colors)
#   end
# end

# describe "#give_non_pink_spaces_a_color" do
#   let(:blank_cards) { new_deck.make_56_spaces }
#   let(:non_pink_cards) { new_deck.give_non_pink_spaces_a_color(blank_cards) }

#   it "makes an array with 56 spaces" do
#     expect(non_pink_cards.length).to eq(56)
#   end

#   it "fills every empty array" do
#     no_empty_arrays = non_pink_cards.map { |card| card.empty? }

#     expect(no_empty_arrays).not_to include(true)
#   end

#   it "fills every empty array_with_a_color" do
#     colors = new_deck.make_5_colors
#     test_cards_have_colors = non_pink_cards.map { |card| colors.include? card[0] }
#     
#     expect(test_cards_have_colors).not_to include(false)
#   end

#   it "disperses a variety of colors" do
#     array_index_counter = 0
#     includes_variance = []
#     until array_index_counter >= 54
#       card = non_pink_cards[array_index_counter] 
#       next_card = non_pink_cards[array_index_counter + 1]
#       card_comparison = card != next_card
#       includes_variance << card_comparison
#       array_index_counter += 1
#     end

#     expect(includes_variance).to include(true)
#   end
# end
end
