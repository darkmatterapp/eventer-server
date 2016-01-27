class Performance < ActiveRecord::Base
  validates :name, presence: :true
  
  belongs_to :event
  has_many :people
end
