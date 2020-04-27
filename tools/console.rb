require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cotv = Cult.new("Children of the Vault")
cotv.slogan = "Kill the Vault Thief!"

khorne = Cult.new("Cult of Khorne")
khorne.minimum_age = 18
khorne.founding_year = -2701
khorne.location = "Earth"
khorne.slogan = "Blood for the Blood God!"


mlp = Cult.new("My Little Pony Fan Club")
bike = Cult.new("Bike Club")
fight = Cult.new("Fight Club")

bob = Follower.new("Bob", 30)
sally = Follower.new("Sally", 7)
pete = Follower.new("Pete", 20)
jane = Follower.new("Jane", 25)
tom = Follower.new("tom", 12)
chris = Follower.new("chris", 40)
alex = Follower.new("alex", 32)
stan = Follower.new("stan", 23)
michael = Follower.new("Jane", 81)

bob.life_motto = "I love 4chan."
sally.life_motto = "I like horses!"

pete.join_cult(cotv)
sally.join_cult(mlp)
bob.join_cult(mlp)

khorne.recruit_follower(bob)
khorne.recruit_follower(pete)
khorne.recruit_follower(jane)

khorne.location = "Earth"
cotv.location = "Pandora"
mlp.location = "Earth"

10.times do
  random_cult = Cult.all[rand(0 .. Cult.all.length-1)]
  random_follower = Follower.all[rand(0..Follower.all.length-1)]
  random_cult.recruit_follower(random_follower)
end

10.times do
  random_cult = Cult.all[rand(0 .. Cult.all.length-1)]
  random_follower = Follower.all[rand(0..Follower.all.length-1)]
  random_follower.join_cult(random_cult)
end


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits


