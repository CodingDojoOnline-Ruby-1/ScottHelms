class AppleTree
  attr_accessor :height, :age, :apple_qty

  def initialize
    @age = 0
    @height = 0
    @apple_qty = 0
  end

  def year_gone_by(year)
    @age += year
    @height += year
    self
  end

  def apple_count
    if @age < 3
      return "too young to produce apples"
    elsif @age > 9
      return "too old to produce apples"
    else
      @apple_qty = @age.to_i * 10
      return @apple_qty.to_i
    end

    # if @age.between?(3,5)          # note: having fun, tests failed - will get back to after "task requirements fulfilled"
    #   @apple_count = rand(5..20)
    # elsif @age > 5
    #   @apple_count = rand(21..30)
    # else
    #   print "too young to produce apples"
    # end
    # self
  end

  def pick_apples
    @apple_qty = 0
  end
end

# puts AppleTree.new.apple_count
# at1 = AppleTree.new
# at1.year_gone_by(5)
# puts at1.apple_count
# puts at1.age
# at2 = AppleTree.new
# puts at2.year_gone_by(6).apple_count