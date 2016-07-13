class Performance < ApplicationRecord
  belongs_to :event
  belongs_to :location
  has_and_belongs_to_many :people
  
  validates :name, presence: :true
end
