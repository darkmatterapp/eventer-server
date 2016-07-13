class Venue < ApplicationRecord
  validates :name, presence: :true
  
  belongs_to :event
  has_many :locations
end
