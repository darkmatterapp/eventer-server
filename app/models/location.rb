class Location < ApplicationRecord
  belongs_to :venue
  has_many :performances
end
