class Stack
  attr_accessor :data_store
  attr_reader :back

  def initialize
    @data_store = []
    # @back = 0
  end

  def push_it(val_to_append)
    @data_store[@data_store.size] = val_to_append
    # print @data_store
    self
  end

  def back
    # oops, didn't follow directions and create a 'back' attribute - created method instead - went with it
    if @data_store.empty?
      @back = 0
    else
      @data_store = @data_store[@data_store.size-1]
      return @data_store
    end
  end

  def pop_it
    if @data_store.empty?
      return nil
    else
      index_var = @data_store.size-1
      @data_store = @data_store[0...index_var]
    end
    # puts index_var
    # @data_store[0...-1]                     # ha! this works too, keep for reference
  end

  def display_array
    @data_store.each do |element|
      print @data_store.join(", ")
    end
    @data_store
  end
end

# puts Stack.new.push_it("test").push_it("test2").push_it(55)
# puts Stack.new.push_it("test").push_it("test2").push_it(55).back
# puts Stack.new.data_store.class.ancestors.include?(Array)

# puts Stack.new.push_it("list").push_it("ends").push_it("extra").pop_it.display_array
# stack1 = Stack.new.push_it("list").push_it("ends").pop_it
# stack1.display_array