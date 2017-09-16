class Event < ApplicationRecord
  validates :name, presence: :true

  belongs_to :user
  has_many :venues
  has_many :sessions
  has_many :people
  has_many :roles
  has_many :participations
  has_many :rsvps
  has_many :links
  has_many :media  # used by photos, audio, video
  has_many :photos # uses media
  has_many :audios # uses media
  has_many :videos # uses media
end
