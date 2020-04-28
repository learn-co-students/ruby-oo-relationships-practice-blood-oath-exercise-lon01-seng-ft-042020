require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("ZIB", "London", 2020, "an eye for an eye")
cult2 = Cult.new("STS", "Texas", 2011, "you lead, we follow")

f1 = Follower.new("Joe", "27", "how high?")
f2 = Follower.new("Zizi", "32", "somebody safe me")

b1 = BloodOath.new(Time.now, cult1, f2)
b2 = BloodOath.new(Time.now, cult1, f1)

cult1.recruit_follower(f1)
cult1.recruit_follower(f2)
binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
