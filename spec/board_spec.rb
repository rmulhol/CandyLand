require 'board'

describe Board do
  let(:new_board) { described_class.new }

  describe "#make_100_spaces" do
    it "makes an array" do
      expect(new_board.make_100_spaces.class).to eq(Array)
    end

    it "makes an array with 3  subarrays" do
      expect(new_board.make_100_spaces[(0..2)]).to eq([[], [], []])  
    end

    it "makes an array with 100 subarrays" do
      expect(new_board.make_100_spaces.length).to eq(100)
    end
  end
  
  describe "#make_6_colors" do
    it "makes an array" do
      expect(new_board.make_6_colors.class).to eq(Array)
    end

    it "contains six elements" do
      expect(new_board.make_6_colors.length).to eq(6)
    end
  end    
end
