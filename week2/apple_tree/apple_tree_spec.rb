require "rspec"
require_relative "apple_tree"

RSpec.describe AppleTree do
  before do
    @appletree = AppleTree.new
  end

  describe "initialize" do
    it "when initialized, Appletree should have default age: 0, height: 0" do
      expect(@appletree.age).to eq(0)
      expect(@appletree.height).to eq(0)
    end
  end

  describe "#year_gone_by" do
    it "apple tree ages 1 year" do
      expect(@appletree.year_gone_by(1).age).to eq(1)
    end
  end

  describe "#apple_count (outside range)" do
    it "apple count nil if outside range" do
      at1 = @appletree.year_gone_by(2)
      expect(at1.apple_count).to eq("too young to produce apples")
      at3 = @appletree.year_gone_by(11)
      expect(at3.apple_count).to eq("too old to produce apples")
    end
  end

  describe "#apple_count (in range)" do
      it "apple count if age is in range" do
        at2 = @appletree
        at2.year_gone_by(5)
        expect(at2.apple_count).to eq(50)
      end
  end

  describe "#pick_apples" do
    it "removes all apples from tree" do
      at1 = @appletree.year_gone_by(6)
      expect(at1.pick_apples).to eq(0)
    end
  end

end