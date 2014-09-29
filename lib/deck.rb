class Deck
  def execute
    empty_deck = make_56_spaces
    colors = make_5_colors
    non_pink_cards = give_non_pink_spaces_a_color(empty_deck, colors)
    
    first_4_pink_cards = make_4_pink_cards
    pink_candycanes = give_all_cards_an_added_element(first_4_pink_cards, "candycane")
    pink_candycanes_with_reverse = give_half_of_the_cards_an_added_element(pink_candycanes, "reverse")
    
    second_4_pink_cards = make_4_pink_cards
    pink_gumdrops = give_all_cards_an_added_element(second_4_pink_cards, "gumdrop")
    pink_gumdrops_with_reverse = give_half_of_the_cards_an_added_element(pink_gumdrops, "reverse")

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

  def give_all_cards_an_added_element(cards_to_modify, element_to_add)
    cards_to_modify.map do |card|
      card << element_to_add
    end
  end

  def give_half_of_the_cards_an_added_element(cards_to_modify, element_to_add)
    number_of_cards = cards_to_modify.length
    half_of_the_cards = number_of_cards / 2
    counter = 0
    until counter == half_of_the_cards
      cards_to_modify[counter] << element_to_add
      counter += 1
    end
    cards_to_modify
  end  
end
