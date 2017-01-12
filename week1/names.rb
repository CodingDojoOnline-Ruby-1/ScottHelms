a = {:first_name => "Michael", :last_name => "Choi"}
b = {:first_name => "John", :last_name => "Supsupin"}
c = {:first_name => "KB", :last_name => "Tonel"}
d = {:first_name => "Jessie", :last_name => "De Leon"}
e = {:first_name => "Jaybee", :last_name => "Balog"}
f = {:first_name => "Strider", :last_name => "Cunningham"}
names = [a, b, c, d, e, f]

puts "you have #{names.size} names in the 'names' array, yo!"
names.each do |name|
    puts "Name = #{name[:first_name]} #{name[:last_name]}"
end

puts "\n", "OR", "\n"

puts "you have #{names.size} names in the 'names' array, yo!"
puts names.collect {|name| " Name: #{name[:first_name]} #{name[:last_name]}"}

puts "\n", "OR", "\n"

puts "you have #{names.size} names in the 'names' array, yo!"
names.each {|name| puts "The name is " + name.values.join(" ")}