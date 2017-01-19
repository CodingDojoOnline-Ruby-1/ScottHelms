require "rspec"
require_relative "stack"

RSpec.describe Stack do
  before do
    @stack = Stack.new
  end

  describe "#initialize" do
    it "need data_store = [] and back = 0 on new instance " do
      expect(@stack.data_store).to eq([])
    end
  end

  describe "#push_it" do
    it "push" do
      test1 = @stack.push_it("val1")
      expect(test1.data_store).to eq(["val1"])
      expect(test1.data_store.class.ancestors.include?(Array)).to eq(true)
    end
  end

  describe "#back" do
    it "display last value added to stack" do
      expect(@stack.back).to eq(0)
      expect(@stack.push_it("test").push_it("test2").push_it(55).back).to eq(55)
    end
    it "raises error if attempt to set" do
      expect{@stack.back = "some_val"}.to raise_error
    end
  end

  describe "#pop_it" do
    it "removes last value of stack" do
      expect(@stack.pop_it).to eq(nil)
      expect(@stack.push_it("list").push_it("ends").push_it("extra").pop_it).to eq(["list","ends"])
    end
  end
end