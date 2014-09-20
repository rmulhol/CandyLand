class Board
  
  def make_100_spaces
    new_array = []
    100.times { new_array << [] }
    new_array
  end

  def make_6_colors
    colors = ["yellow", "blue", "green", "pink", "red", "orange"]
  end

  def insert_colors_into_spaces
    board = make_100_spaces
    colors = make_6_colors
    board.map do |space|
      space << colors[rand(6)]
    end
  end

end
