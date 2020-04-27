class Cult
    attr_reader :name, :location, :founding_year, :slogan 

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self)
    end

    def bloodOaths
        BloodOath.all.select {|bloodOath| bloodOath.cult == self}
    end

    def followers
        bloodOaths.map {|bloodOath| bloodOath.follower}
    end

    def cult_population
        followers.length
    end

    def self.find_by_name(name)
        self.all.find {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select {|cult| cult.founding_year == founding_year}
    end

    def followers_average_ages
        total_age = followers.reduce(0) {|sum, follower| sum + follower.age}
        total_age / followers.length
    end

    def my_followers_mottos
        followers.map {|follower| follower.life_motto}
    end

    def self.least_popular
        Cult.all.min_by {|cult| cult.followers.length}
    end

    def self.locations
        Cult.all.map {|cult| cult.location}
    end

    def self.locations_hash
        hash = Hash.new(0)
        self.locations.map {|location| hash[location] += 1}
        hash.max_by {|location, count| count}[0]
    end

    def self.most_popular_location
        least_popular = Cult.all.max_by {|location, count| count}
    end

end