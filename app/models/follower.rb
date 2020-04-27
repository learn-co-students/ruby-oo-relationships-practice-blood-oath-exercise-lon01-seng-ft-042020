class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def self.all
        @@all
    end
    def save
        self.class.all << self
    end

    def initialize(name, age)
        @name = name
        @age = age
       self.save 
    end

    def self.of_a_certain_age(target_age)
        self.all.select{ |follower| follower.age >= target_age}
    end
    
    def cults
        BloodOath.all.select{|bo| bo.follower == self}.map{|bo| bo.cult}
    end

    def is_follower?(cult)
        self.cults.include?(cult)
    end

    def join_cult(cult)
        # BloodOath.new(cult, self)    
        min_age =  cult.minimum_age || 0    
        
        if self.is_follower?(cult)
            puts "#{self.name} is already a member of #{cult.name}"
        else
            if self.age >= min_age
                BloodOath.new(cult, self)
            else
                puts "#{self.name} is too young to join #{cult.name}"
            end
        end
    end

    def my_cults_slogans
        self.cults.map{|cult| cult.slogan}.reject{|item| item == nil}
    end

    def self.most_active
        all.max_by{|fl|fl.cults.length}
    end

    def self.top_ten
        all.max_by(10){|fl| fl.cults.length}
    end

    def fellow_cult_members
        cults.map{|cult| cult.followers}.flatten.uniq
    end

end