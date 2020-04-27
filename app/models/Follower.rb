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

    def cults
        bloodaoths = BloodOath.all.select {|bloodoath| bloodoath.follower == self}
        bloodaoths.map {|bloodoath| bloodoath.cult}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        self.all.select {|follower| follower.age >= age}
    end
    
end