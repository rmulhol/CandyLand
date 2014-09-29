class Deck
  def execute
    empty_deck = make_56_spaces
    colors = make_5_colors
    non_pink_cards = give_non_pink_spaces_a_color(empty_deck, colors)
    
    first_4_pink_cards = make_4_pink_cards
    pink_candycanes = give_cards_added_element(first_4_pink_cards, "candycane")
    pink_candycanes_with_reverse = add_reverse_to_2_cards(pink_candycanes)
    
    second_4_pink_cards = make_4_pink_cards
    pink_gumdrops = give_cards_added_element(second_4_pink_cards, "gumdrop")
    pink_gumdrops_with_reverse = add_reverse_to_2_cards(pink_gumdrops)

    complete_deck = non_pink_cards + pink_candycanes_with_reverse + pink_gumdrops_with_reverse
    
    complete_deck.shuffle
  end

  private

  def make_56_spaces
    Array.new(56) { [] }
  end
  
  def make_5_colors
    ["yellow", "blue", "green", "red", "orange"]
  end

  def give_non_pink_spaces_a_color(empty_deck, colors)
    number_of_colors = colors.length
    empty_deck.map { |space| space << colors[rand(number_of_colors)] }
  end

  def make_4_pink_cards
   Array.new(4) { ["pink"] }
  end 

  def give_cards_added_element(cards_to_modify, element_to_add)
    cards_to_modify.map do |card|
      card << element_to_add
    end
  end

  def add_reverse_to_2_cards(cards_to_modify)
    counter = 0
    until counter > 1
      cards_to_modify[counter] << "reverse"
      counter += 1
    end
    cards_to_modify
  end  
end
