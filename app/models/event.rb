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

  def date_range
    (start_date..end_date).to_a
  end

  def date_display
    # TODO? November 1st, 2017 - November 1st, 2018

    start_month = start_date.strftime("%B")
    start_day   = start_date.strftime("%d").to_i.ordinalize
    start_year  = start_date.strftime("%Y")

    end_month = end_date.strftime("%B")
    end_day   = end_date.strftime("%d").to_i.ordinalize
    end_year  = end_date.strftime("%Y")

    # August 29th, 2018
    if start_date.month == end_date.month &&
       start_date.day   == end_date.day   &&
       start_date.year  == end_date.year
      "#{start_month} #{start_day}, #{start_year}"

    # August 29th - 30th, 2018
    elsif start_date.month == end_date.month &&
          start_date.day   != end_date.day   &&
          start_date.year  == end_date.year
      "#{start_month} #{start_day} - #{end_day}, #{start_year}"

    # August 29th - September 1st, 2018
    # November 1st - December 1st, 2018
    elsif start_date.month != end_date.month &&
          start_date.year  == end_date.year
      "#{start_month} #{start_day} - #{end_month} #{end_day}, #{start_year}"

    # December 29th, 2018 - January 1st, 2019
    elsif start_date.month != end_date.month &&
          start_date.day   != end_date.day   &&
          start_date.year  != end_date.year
      "#{start_month} #{start_day}, #{start_year} - #{end_month} #{end_day}, #{end_year}"
    end
  end

  def name_and_iterator
    "#{name} #{iterator}"
  end

  def location
    "#{city}, #{state}"
  end

end
