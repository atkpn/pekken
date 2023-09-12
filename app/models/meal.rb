class Meal < ApplicationRecord
  belongs_to :pet
  belongs_to :feed
end
