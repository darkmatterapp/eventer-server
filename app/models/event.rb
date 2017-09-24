class Event < ApplicationRecord

  has_permalink :create_slug

  has_many :venues
  has_many :sessions
  has_many :participants
  has_many :roles
  has_many :participations
  has_many :rsvps
  has_many :links
  has_many :media  # used by photos, audio, video
  has_many :photos # uses media
  has_many :audios # uses media
  has_many :videos # uses media

  belongs_to :user

  validates :name, presence: :true

  def date_range
    (start_date..end_date).to_a
  end

  def create_slug
    "#{name} #{iterator} #{city} #{state}"
  end
end
