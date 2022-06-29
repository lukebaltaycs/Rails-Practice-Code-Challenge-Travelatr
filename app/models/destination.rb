class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def to_s
        self.name + ", " + self.country
    end


    def avg_age
        k = self.bloggers.uniq.map{|b| b.age}
        k.sum / k.count
    end

end
