require "date"
require "pry"
class Cult 
    attr_reader :name, :location, :founding_year, :slogan, :followers
    @@all = []
    def initialize(name, location, founding_year,slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        #@followers = [] #get rid of this
        @@all << self
    end 

    def recruit_follower(follower)
       # @followers << follower
        BloodOath.new(Date.today.strftime("%Y-%m-%d"),self, follower)
    end

    #make a blood oath method that gets all the blood oaths for this cult instance (can copy from follower)
    #make a method that gets all followers for this cult instance
    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
    end

    def followers
       self.blood_oaths.map{|blood_oath| blood_oath.followers}
    end

    def cult_population
        self.followers.length
    end

    def self.all
        @@all
    end
        #should be select
    def self.find_by_name(cult_name)
        Cult.all.find{|cult| cult.name == cult_name}
    end
        #should be select
    def self.find_by_location(cult_location)
        Cult.all.find{|cult| cult.location == cult_location}
    end
        #should be select
    def self.find_by_founding_year(cult_founding_year)
        Cult.all.find{|cult| cult.founding_year == cult_founding_year}
    end

    def average_age
        total_age = self.followers.map{|follower| follower.age}.sum.to_f
        total_age/cult_population
    end

    def my_followers_mottos
        self.followers.each{|follower| puts follower.life_motto}
    end

    def self.least_popular
        Cult.all.min_by{|cult| cult.cult_population}
    end

    def self.find_all_by_location(cult_location)
        Cult.all.find_all{|cult| cult.location == cult_location}
    end
    #why does this default to the first location when there is no most popular?
    def self.most_common_location
        locations = Cult.all.map{|cult| cult.location}
        locations.max_by{|location| locations.count(location)}
    end
end