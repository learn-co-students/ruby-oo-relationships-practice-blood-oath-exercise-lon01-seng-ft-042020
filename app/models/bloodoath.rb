class BloodOath
    
    attr_reader :follower, :cult
    
    @@all = []

    def self.all
        @@all
    end
    def save
        self.class.all << self
    end

    def initialize(cult, follower)
        @follower = follower
        @cult = cult
        @initiation_date = Date.today
       self.save 
    end

    def self.first_oath
        self.all.min_by{|bo|bo.initiation_date}
    end
end