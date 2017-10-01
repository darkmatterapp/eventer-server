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

  has_many :media  # used by photos, audio, video
  has_many :audios # uses media
  has_many :photos # uses media
  has_many :videos # uses media

  belongs_to :user

  validates :name, presence: :true

  def create_slug
    "#{name} #{iterator} #{city} #{state}"
  end

  def date_range
    (start_date..end_date).to_a
  end

  def date_display
    # TODO this needs to factor in all possible start and end date combinations
    # August 29th, 2018
    # August 29th - 30th, 2018
    # August 29th - Sep 1st, 2018
    # December 29th, 2018 - January 1st, 2019

    "#{sd("%B")} #{sd("%-d").to_i.ordinalize}, #{sd("%Y")}"
  end

  def name_and_iterator
    "#{name} #{iterator}"
  end

  def location
    "#{city}, #{state}"
  end

  private

  def ed(s)
    end_date.strftime(s)
  end

  def sd(s)
    start_date.strftime(s)
  end

end
