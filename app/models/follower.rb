class Follower

    attr_reader :name 
    attr_accessor :age, :life_motto
    
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @ago = age
        @life_motto = "life motto"
        @@all << self
    end
    
    def bloodoaths_f
        Bloodoath.all.select {|b| b.follower == self}
    end

    def cults
        self.bloodoaths_f.map {|c| c.cult }
    end  
   
    def join_cult(cult) 
        Bloodoath.new(initiation_date, cult, self)
    end

    def self.of_a_certain_age(f_age)
        bloodoaths_f.select {|bloodoaths_f| bloodoaths_f.age >= f_age}
    end

    def self.all
        @@all
    end

end