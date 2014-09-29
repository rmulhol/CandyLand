class Board
  def execute
    empty_board = make_100_spaces
    colors = make_6_colors
    board_with_colors = insert_colors_into_spaces(empty_board, colors)
    
    pink_spaces = add_candycanes_and_gumdrops(board_with_colors)
    non_pink_spaces = add_sticky_spaces(board_with_colors, 5)
    
    all_spaces = complete_board(pink_spaces, non_pink_spaces)
    
    all_spaces.shuffle
  end

  def make_6_colors
    colors = ["yellow", "blue", "green", "pink", "red", "orange"]
  end

  private

  def make_100_spaces
    Array.new(100) { [] }
  end

  def insert_colors_into_spaces(empty_board, colors)
    number_of_colors = colors.length
    empty_board.map do |space|
      space << colors[rand(number_of_colors)]
    end
  end

  def separate_pink_spaces(board_with_colors)
    board_with_colors.select { |element| element.include? "pink" }
  end

  def add_candycanes_and_gumdrops(board_with_colors)
    pink_spaces = separate_pink_spaces(board_with_colors)
    pink_spaces.map do |space| 
      rand(2) == 1 ? space << "candycane" : space << "gumdrop"
    end
  end

  def separate_non_pink_spaces(board_with_colors)
    pink_spaces = separate_pink_spaces(board_with_colors)
    non_pink_spaces = board_with_colors - pink_spaces    
  end

  def add_sticky_spaces(board_with_colors, number_of_sticky_spaces)
    potential_sticky_spaces = separate_non_pink_spaces(board_with_colors)
    counter = 1
    number_of_sticky_spaces.times do
      potential_sticky_spaces[counter] << "sticky"
      counter += 1
    end
    board_with_sticky_spaces = potential_sticky_spaces
  end

  def complete_board(pink_spaces, non_pink_spaces)
    complete_board = pink_spaces + non_pink_spaces
  end
end
