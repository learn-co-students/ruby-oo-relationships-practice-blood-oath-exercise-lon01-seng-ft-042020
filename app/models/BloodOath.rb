require 'date'

class BloodOath
    attr_reader :date, :follower, :cult

    @@all = []

    def initialize(follower, cult, date="#{Time.now.year}-#{Time.now.month}-#{Time.now.day}")
        @follower = follower
        @cult = cult
        @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @@all << self
    end

    def self.all
        @@all
    end

    def initiation_date
        @initiation_date
    end
    
end