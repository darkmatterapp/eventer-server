class Location < ActiveRecord::Base
  belongs_to :venue
  has_many :performances
end
