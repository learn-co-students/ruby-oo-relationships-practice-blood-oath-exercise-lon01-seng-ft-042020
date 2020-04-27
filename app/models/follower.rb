class Follower
    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name,age ,life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def join_cult(cult)
        BloodOath.new(Date.today.strftime("%Y-%m-%d"),cult, self)
    end

    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
    end

    def cults
       self.blood_oaths.map{|blood_oath| blood_oath.cult}
    end

    def self.all
        @@all
    end

    def self.of_certain_age(age)
        Follower.all.select{|fol| fol.age >= age}
    end

    def my_cults_slogans
        cults.each {|cult| puts cult.slogan}
    end

    def self.most_active
        Follower.all.max_by{|follower| follower.blood_oaths.length}
    end

    def self.top_ten
        Follower.all.max_by(10){|follower| follower.blood_oaths.length}
    end

end