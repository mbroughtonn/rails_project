class Game < ApplicationRecord
  belongs_to :publisher
  belongs_to :genre
end
