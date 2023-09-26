class DefaultItem < ApplicationRecord
  has_one :care, dependent: :destroy
end
