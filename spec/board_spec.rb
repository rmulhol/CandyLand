require 'board'

describe Board do
  let(:new_board) { described_class.new }

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
      expect(new_board.insert_colors_into_spaces.class).to eq(Array)
      expect(new_board.insert_colors_into_spaces.length).to eq(100)
    end
    
    it "fills every empty array" do
      expect(new_board.insert_colors_into_spaces).not_to include([])
    end

    it "fills every empty array with a color" do
      colors = new_board.make_6_colors
      expect(new_board.insert_colors_into_spaces.map { |space| colors.include? space[0] }).not_to include false
    end

    it "fills every empty array with different colors" do
      my_board = new_board.insert_colors_into_spaces
      expect((1..99).to_a.map { |index| my_board[index] == my_board[index - 1] }).to include false
    end
  end  
end
