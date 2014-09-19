require 'board'

describe Board do
  let(:new_board) { described_class.new }

  describe "#make_100_spaces" do
    it "makes an array" do
      expect(new_board.make_100_space.class).to eq(Array)
    end
  end

end
