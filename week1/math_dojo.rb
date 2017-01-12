class MathDojo
    attr_accessor :total
    def initialize
        @total = 0
    end
    def add *add_val
        @total += add_val.flatten.reduce(:+)
        self
    end
    def subtract *sub_val
        @total -= sub_val.flatten.reduce(:+)  # get sum first, then subtract sum
        self
    end
end
test1 = MathDojo.new.add(2).add(2,5).subtract(2,3).total
test2 = MathDojo.new.add(1).add([3,5,7,8],[2,4.3,1.25]).subtract([2,3],[1.1,2.3]).total
puts test1, test2


# BEFORE REFACTOR:     NO NEED FOR IF == ARRAY because splat * coerces everything to array

# class MathDojo
#     attr_accessor :total
#     # @@total = 0
#     def initialize
#         @total = 0
#     end
#     def add(*add_val)
#         sum = 0
#         if add_val.class == Array
#             x = add_val.flatten.inject {|sum, i| sum += i }
#         else
#             x = add_val.inject {|sum, i| sum += i }
#         end
#         @total += x.to_f
#         # puts @total
#         self
#     end
#     def subtract *sub_val
#         diff = 0
#         if sub_val.class == Array
#             y = sub_val.flatten.inject {|diff, i| diff += i}    # add 1st
#         else
#             y = sub_val.inject {|diff, i| diff += i}            # add 1st
#         end
#         @total -= y.to_f                                       # then, subtract sum here
#         # puts @total
#         self
#     end
#     def result
#         puts "result: #{@total}"
#         self
#     end
# end
# test1 = MathDojo.new.add(2).add(2,5).subtract(2,3).result
# test2 = MathDojo.new.add(1).add([3,5,7,8],[2,4.3,1.25]).subtract([2,3],[1.1,2.3]).result
# puts test1, test2