class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :minimum_age

    @@all = []

    def self.all
        @@all
    end
    def save
        self.class.all << self
    end

    def initialize(name)
        @name = name
       self.save 
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end

    def in_cult?(follower)
        self.followers.include?(follower)
    end

    def recruit_follower(follower)
        # BloodOath.new(self, follower)
        min_age = self.minimum_age || 0
        if self.in_cult?(follower)
            puts "#{follower.name} is already a member of #{self.name}"
        else
            if follower.age >= min_age 
                BloodOath.new(self, follower)
            else
                puts "#{follower.name} is too young to join #{self.name}"
            end
        end
    end

    def followers
        BloodOath.all.select{|bo| bo.cult == self}.map{|bo| bo.follower}
    end

    def cult_population
        self.followers.length
    end

    def average_age
       self.followers.sum{|fl| fl.age} / self.cult_population.to_f
    end

    def my_followers_mottos
        self.followers.map{|fl| fl.life_motto}.reject{|fl| fl.life_motto == nil}
    end

    def self.least_popular
        Cult.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
        counts = Hash.new(0)
        Cult.all.each{ |cult| counts[cult.location] += 1}
        max_count = 0
        max_count_loc = nil
        counts.each{|loc,count| count > max_count ? max_count_loc = loc : nil}
        max_count_loc
    end



end