class Game < ApplicationRecord
  belongs_to :publisher
  belongs_to :genre

  validates :title, presence: true
  validates :release_year, presence: true, numericality: { only_integer: true }
  validates :rating, presence: true, inclusion: { in: ['E', 'T', 'M', 'E10+', 'RP', 'AO'], message: "%{value} is not a valid rating" }
  validates :publisher, presence: true
  validates :genre, presence: true
  validates :console, presence: true
end
