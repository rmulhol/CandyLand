require 'board'

describe Board do
  let(:new_board) { described_class.new }
  let(:empty_board) { new_board.make_100_spaces }
  let(:colors) { new_board.make_6_colors }
  let(:board_with_colors) { new_board.insert_colors_into_spaces(empty_board, colors) }
  
  describe "#make_100_spaces" do
    it "makes an array" do
      expect(new_board.make_100_spaces.class).to eq(Array)
    end

    it "makes an array with subarrays" do
      expect(new_board.make_100_spaces).to include([])  
    end

    it "makes an array with 100 subarrays" do
      expect(new_board.make_100_spaces.length).to eq(100)
    end
  end
  
  describe "#make_6_colors" do
    it "makes an array" do
      expect(new_board.make_6_colors.class).to eq(Array)
    end

    it "makes an array with six elements" do
      expect(new_board.make_6_colors.length).to eq(6)
    end

    it "makes an array with six colors" do
      expect(new_board.make_6_colors).to include("yellow", "blue", "green", "pink", "red", "orange")
    end
  end

  describe "#insert_colors_into_spaces" do
    it "creates an array with 100 spaces" do
      expect(board_with_colors.class).to eq(Array)
      expect(board_with_colors.length).to eq(100)
    end
    
    it "fills every empty array" do
      expect(board_with_colors).not_to include([])
    end

    it "fills every empty array with a color" do
      colors = new_board.make_6_colors
      expect(board_with_colors.map { |space| colors.include? space[0] }).not_to include(false)
    end

    it "fills every empty array with different colors" do
      my_board = board_with_colors
      expect((1..99).to_a.map { |index| my_board[index] == my_board[index - 1] }).to include(false)
    end
  end

  describe "#separate_pink_spaces" do
    it "returns an array" do
      expect(new_board.separate_pink_spaces(board_with_colors).class).to eq(Array)
    end

    it "returns an array with only pink spaces" do
      expect(new_board.separate_pink_spaces(board_with_colors).map { |element| element.include? "pink" }).not_to include(false)
    end
  end

  describe "#add_candycanes_and_gumdrops" do
    it "adds an element to every pink space" do
      expect(new_board.add_candycanes_and_gumdrops(board_with_colors).map { |element| element.length == 2 }).not_to include(false)
    end

    it "adds candycanes to pink spaces" do
      expect(new_board.add_candycanes_and_gumdrops(board_with_colors).map { |element| element.include? "candycane" }).to include(true)
    end

    it "adds gumdrops to pink spaces" do
      expect(new_board.add_candycanes_and_gumdrops(board_with_colors).map { |element| element.include? "gumdrop" }).to include(true)
    end
  end

  describe "#separate_non_pink_spaces" do
    it "returns an array" do
      expect(new_board.separate_non_pink_spaces(board_with_colors).class).to eq(Array)
    end

    it "returns an array without pink spaces" do
      expect(new_board.separate_non_pink_spaces(board_with_colors).map { |element| element.include? "pink"}).not_to include(true)
    end
  end

  describe "#add_sticky_spaces" do
    it "returns an array" do
      expect(new_board.add_sticky_spaces(board_with_colors).class).to eq(Array)
    end

    it "doesn't include any pink spaces" do
      expect(new_board.add_sticky_spaces(board_with_colors).map { |element| element.include? "pink" }).not_to include(true)
    end

    it "adds sticky to spaces" do
      expect(new_board.add_sticky_spaces(board_with_colors).map { |element| element.include? "sticky" }).to include(true)
    end

    it "adds sticky to five spaces" do
      expect(new_board.add_sticky_spaces(board_with_colors).select { |element| element.include? "sticky" }.length).to eq(5)
    end
  end

  describe "#complete_board" do
    let(:pink_spaces) { new_board.add_candycanes_and_gumdrops(board_with_colors) }
    let(:non_pink_spaces) { new_board.add_sticky_spaces(board_with_colors) }
    
    it "returns an array" do
      expect(new_board.complete_board(pink_spaces, non_pink_spaces).class).to eq(Array)
    end

    it "has 100 spaces" do
      expect(new_board.complete_board(pink_spaces, non_pink_spaces).length).to eq(100)
    end

    it "has five sticky spaces" do
      expect(new_board.complete_board(pink_spaces, non_pink_spaces).select { |element| element.include? "sticky" }.length).to eq(5)
    end

    it "attaches candycane or gumdrop to every pink space" do
      complete_board = new_board.complete_board(pink_spaces, non_pink_spaces)
      pink_spaces = complete_board.select { |element| element.include? "pink" }
      pink_spaces_with_candycanes = pink_spaces.select { |element| element.include? "candycane" }
      pink_spaces_with_gumdrops = pink_spaces.select { |element| element.include? "gumdrop" }
      expect(pink_spaces_with_candycanes.length + pink_spaces_with_gumdrops.length).to eq(pink_spaces.length)
    end
  end
end
