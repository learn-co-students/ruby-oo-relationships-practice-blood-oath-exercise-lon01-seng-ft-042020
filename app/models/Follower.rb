class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def bloodoaths
        BloodOath.all.select {|bloodoath| bloodoath.follower == self}
    end

    def cults
        bloodoaths.map {|bloodoath| bloodoath.cult}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end

    def my_cults_slogans
        self.cults.map {|cult| cult.slogan}
    end

    def self.most_active
        hash = Hash.new(0)
        self.bloodoaths.map {|bloodoath| hash[bloodoath] =+ 1}
    end
    
end