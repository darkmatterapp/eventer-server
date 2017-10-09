class Event < ApplicationRecord

  has_permalink :create_slug

  has_many :links
  has_many :participants
  has_many :participations
  has_many :roles
  has_many :rsvps
  has_many :sessions
  has_many :sponsor_levels
  has_many :sponsors, through: :sponsor_levels
  has_many :venues
  has_many :locations, through: :venues

  has_many :media  # used by photos, audio, video
  has_many :audios # uses media
  has_many :photos # uses media
  has_many :videos # uses media

  belongs_to :user

  validates :name, presence: :true

  def create_slug
    "#{name} #{iterator} #{city} #{state}"
  end

end
