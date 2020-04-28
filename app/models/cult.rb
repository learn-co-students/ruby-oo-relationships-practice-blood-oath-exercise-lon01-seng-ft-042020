class Cult
    
    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = "slogan"
        @@all << self
    end

    def recruit_follower(follower)  
        BloodOath.new(initiation_date: Time.now, cult: self, follower: follower)
    end

    def blood_oaths
        BloodOath.all.select {|blood_oaths| blood_oaths.cult == self}
    end

    def followers
        self.blood_oaths.map {|f| f.follower }
    end

    def cult_population
        self.followers.count
        #Bloodoath.all.select{|oath| oath.cult == self}.size
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        Cult.all.find {|c| c.name == cult_name}
    end

    def self.find_by_location(cult_loction)
        self.all.select {|c| c.location == cult_loction}
    end

    def self.find_by_founding_year(cult_founding_year)
        self.all.select {|c| c.founding_year = cult_founding_year}
    end

    def self.least_popular
        @@all.min_by {|c| c.cult_population}
    end

end