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
    # TODO this needs to factor in all possible start and end date combinations
    # x August 29th, 2018
    # x August 29th - 30th, 2018
    # x August 29th - September 1st, 2018
    # x December 29th, 2018 - January 1st, 2019

    if start_date.month == end_date.month &&
       start_date.day   == end_date.day   &&
       start_date.year  == end_date.year
      # August 29th, 2018
      start_date.strftime("%B ") +
      start_date.strftime("%d").to_i.ordinalize +
      "," +
      start_date.strftime(" %Y")

    elsif start_date.month == end_date.month &&
          start_date.day   != end_date.day   &&
          start_date.year  == end_date.year
      # August 29th - 30th, 2018
      start_date.strftime("%B ") +
      start_date.strftime("%d").to_i.ordinalize +
      " - " +
      end_date.strftime("%d").to_i.ordinalize +
      "," +
      start_date.strftime(" %Y")

    elsif start_date.month != end_date.month &&
          start_date.day   != end_date.day   &&
          start_date.year  == end_date.year
          # August 29th - September 1st, 2018
      start_date.strftime("%B ") +
      start_date.strftime("%d").to_i.ordinalize +
      " - " +
      end_date.strftime("%B ") +
      end_date.strftime("%d").to_i.ordinalize +
      "," +
      start_date.strftime(" %Y")

    elsif start_date.month != end_date.month &&
          start_date.day   != end_date.day   &&
          start_date.year  != end_date.year
          # December 29th, 2018 - January 1st, 2019
      start_date.strftime("%B ") +
      start_date.strftime("%d").to_i.ordinalize +
      "," +
      start_date.strftime(" %Y") +
      " - " +
      end_date.strftime("%B ") +
      end_date.strftime("%d").to_i.ordinalize +
      "," +
      end_date.strftime(" %Y")

    end
       
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

end
