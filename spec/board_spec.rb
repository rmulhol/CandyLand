require 'board'

describe Board do
  let(:new_board) { described_class.new }
  let(:empty_board) { new_board.make_100_spaces }
  let(:colors) { new_board.make_6_colors }
  let(:board_with_colors) { new_board.insert_colors_into_spaces(empty_board, colors) }
  
  describe "#make_100_spaces" do
    it "makes an array with subarrays" do
      expect(new_board.make_100_spaces).to include([])  
    end

    it "makes an array with 100 subarrays" do
      expect(new_board.make_100_spaces.length).to eq(100)
    end
  end
  
  describe "#make_6_colors" do
    it "makes an array with six elements" do
      colors = new_board.make_6_colors
      
      expect(colors.length).to eq(6)
    end

    it "includes each of the colors as an element" do
      colors = "yellow", "blue", "green", "pink", "red", "orange"
      expect(new_board.make_6_colors).to include(*colors)
    end
  end

  describe "#insert_colors_into_spaces" do
    it "creates an array with 100 spaces" do
      expect(board_with_colors.length).to eq(100)
    end
    
    it "fills every empty array" do
      expect(board_with_colors).not_to include([])
    end

    it "fills every empty array with a color" do
      colors = new_board.make_6_colors
      includes_colors = board_with_colors.map { |space| colors.include? space[0] }
      
      expect(includes_colors).not_to include(false)
    end

    it "fills every empty array with different colors" do
      my_board = board_with_colors
      includes_variance = (1..99).to_a.map { |index| my_board[index] == my_board[index - 1] }
      
      expect(includes_variance).to include(false)
    end
  end

  describe "#separate_pink_spaces" do
    it "returns an array with only pink spaces" do
      exclusively_pink = new_board.separate_pink_spaces(board_with_colors).map { |element| element.include? "pink" }

      expect(exclusively_pink).not_to include(false)
    end
  end

  describe "#add_candycanes_and_gumdrops" do
    let(:pink_spaces) { new_board.add_candycanes_and_gumdrops(board_with_colors) }
    
    it "adds an element to every pink space" do
      includes_more_than_pink = pink_spaces.map { |element| element.length == 2 }
      
      expect(includes_more_than_pink).not_to include(false)
    end

    it "adds candycanes to pink spaces" do
      includes_candycanes = pink_spaces.map { |element| element.include? "candycane" }
      
      expect(includes_candycanes).to include(true)
    end

    it "adds gumdrops to pink spaces" do
      includes_gumdrops = pink_spaces.map { |element| element.include? "gumdrop" }
      
      expect(includes_gumdrops).to include(true)
    end
  end

  describe "#separate_non_pink_spaces" do
    it "returns an array without pink spaces" do
      no_pink_spaces = new_board.separate_non_pink_spaces(board_with_colors)
      does_not_include_pink_spaces = no_pink_spaces.map { |element| element.include? "pink"}

      expect(does_not_include_pink_spaces).not_to include(true)
    end
  end

  describe "#add_sticky_spaces" do
    it "doesn't include any pink spaces" do
      no_pink_spaces = new_board.add_sticky_spaces(board_with_colors)
      does_not_include_pink_spaces = no_pink_spaces.map { |element| element.include? "pink" }

      expect(does_not_include_pink_spaces).not_to include(true)
    end

    it "adds sticky to spaces" do
      board_with_sticky_spaces = new_board.add_sticky_spaces(board_with_colors)
      yes_sticky_spaces = board_with_sticky_spaces.map { |element| element.include? "sticky" }

      expect(yes_sticky_spaces).to include(true)
    end

    it "adds sticky to five spaces" do
      board_with_sticky_spaces = new_board.add_sticky_spaces(board_with_colors)
      five_sticky_spaces = board_with_sticky_spaces.select { |element| element.include? "sticky" }
      
      expect(five_sticky_spaces.length).to eq(5)
    end
  end

  describe "#complete_board" do
    let(:pink_spaces) { new_board.add_candycanes_and_gumdrops(board_with_colors) }
    let(:non_pink_spaces) { new_board.add_sticky_spaces(board_with_colors) }
    let(:final_board) { new_board.complete_board(pink_spaces, non_pink_spaces) }
    
    it "has 100 spaces" do
      expect(final_board.length).to eq(100)
    end

    it "has five sticky spaces" do
      five_sticky_spaces = final_board.select { |element| element.include? "sticky" }
      
      expect(five_sticky_spaces.length).to eq(5)
    end

    it "attaches candycane or gumdrop to every pink space" do
      pink_spaces = final_board.select { |element| element.include? "pink" }
      amount_of_pink_spaces = pink_spaces.length
      pink_spaces_with_candycanes = pink_spaces.select { |element| element.include? "candycane" }
      pink_spaces_with_gumdrops = pink_spaces.select { |element| element.include? "gumdrop" }
      amount_of_pink_spaces_with_candycanes_and_gumdrops = pink_spaces_with_candycanes.length + pink_spaces_with_gumdrops.length

      expect(amount_of_pink_spaces).to eq(amount_of_pink_spaces_with_candycanes_and_gumdrops)
    end
  end
end
