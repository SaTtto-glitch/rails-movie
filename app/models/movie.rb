class Movie < ApplicationRecord
    validates :name, presence: true, length: { maximum: 160 }
    validates :year, length: { maximum: 45 }
    validates :description, length: { maximum: 1000 }
    validates :image_url, length: { maximum: 150 }
    validates_uniqueness_of :name
end