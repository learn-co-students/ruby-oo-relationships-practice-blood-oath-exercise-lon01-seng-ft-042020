require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("Cool Guys", "london", 1985, "cool guyssss")
cult2 = Cult.new("Gang", "spain", 1880, "gang slogan")
cult3 = Cult.new("Gals", "spain", 2020, "gallies")
cult4 = Cult.new("Culty", "italy", 2992, "shhhhh")

fol1 = Follower.new("Gbenga", 23, "Hay")
fol2 = Follower.new("HAnnah", 27, "life.")
fol3 = Follower.new("Stacey", 76, "firenedhsip")
fol4 = Follower.new("Dave", 34, "nice one m8")

cult1.recruit_follower(fol4)
cult1.recruit_follower(fol3)
cult2.recruit_follower(fol1)
cult4.recruit_follower(fol4)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
