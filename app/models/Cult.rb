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
        self.all.select {|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select {|cult| cult.location == location}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select {|cult| cult.founding_year == founding_year}
    end

    def followers_average_ages
        bloodOaths = BloodOath.all.select {|bloodOath| bloodOath.cult == self}
        followers_total_ages = bloodOaths.select {|bloodOath| bloodOath.follower.age}.sum
        followers_total_ages / cult_population
    end


    def followers_mottos
        followers.map {|follower| follower.life_motto}
    end

    def least_popular
        num_followers = self.followers.length
        Cult.all.min_by {|cult| cult.num_followers}
    end

end