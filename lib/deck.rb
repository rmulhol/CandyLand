class Deck
  def execute
    empty_deck = make_56_spaces
    non_pink_cards = give_non_pink_spaces_a_color(empty_deck)
    pink_candycanes = give_4_pink_cards_candycanes
    pink_gumdrops = give_4_pink_cards_gumdrops
    pink_candycanes_with_reverse = add_reverse_to_2_cards(pink_candycanes)
    pink_gumdrops_with_reverse = add_reverse_to_2_cards(pink_gumdrops)
    complete_deck = non_pink_cards + pink_candycanes_with_reverse + pink_gumdrops_with_reverse
    complete_deck.shuffle
  end

  def make_56_spaces
    Array.new(56) { [] }
  end

  def make_4_pink_cards
   Array.new(4) { ["pink"] }
  end 

  def give_4_pink_cards_candycanes
    pink_cards = make_4_pink_cards
    pink_cards.map do |card|
      card << "candycane"
    end
  end

  def give_4_pink_cards_gumdrops
    pink_cards = make_4_pink_cards
    pink_cards.map do |card|
      card << "gumdrop"
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
  
  def make_5_colors
    ["yellow", "blue", "green", "red", "orange"]
  end

  def give_non_pink_spaces_a_color(empty_deck)
    colors = make_5_colors
    empty_deck.map { |space| space << colors[rand(5)] }
  end
end
