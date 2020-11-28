require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

illuminati = Cult.new("illuminati","federal reserve",1776,"In God We Trust")	
scientology = Cult.new("scientology","california",1970,"We love Tom Cruise")	
branchdavidians = Cult.new("branch davidians","texas",1993,"Come at us bro")
bikram = Cult.new("Bikram","california",1990,"Savasana")

ladygaga = Follower.new("Lady Gaga", 25, "Bad Romance")	
tomcruise = Follower.new("Tom Cruise", 54, "I love my ex-wife")	
david = Follower.new("David Branch", 35, "I'm Jesus")	
sarah = Follower.new("Sarah", 23, "I love cats")
charlie = Follower.new("Charlie", 27, "YOLO")

oath1 = BloodOath.new(ladygaga, illuminati, "1776-07-04")
oath2 = BloodOath.new(tomcruise, scientology, "1970-01-01")	
oath3 = BloodOath.new(david, branchdavidians, "1993-12-31")
oath4 = BloodOath.new(charlie, scientology, "2020-04-27")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits