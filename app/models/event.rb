class Event < ActiveRecord::Base
  validates :name, presence: :true

  has_many :venues
  has_many :performances
  has_many :people
  has_many :media
  has_many :photos
  has_many :audios
  has_many :videos
end
