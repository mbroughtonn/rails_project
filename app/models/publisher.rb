class Publisher < ApplicationRecord
    has_many :games

    validates :name, presence: true, uniqueness: true
end
