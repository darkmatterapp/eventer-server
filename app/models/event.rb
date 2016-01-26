class Event < ActiveRecord::Base
  validates :name, presence: :true

  has_many :venues
  has_many :performances
end
