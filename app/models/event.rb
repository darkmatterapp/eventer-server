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

  def create_slug
    "#{name} #{iterator} #{city} #{state}"
  end

  def date_range
    (start_date..end_date).to_a
  end

  def date_display
    # TODO this needs more love, got started, didn't finish
    string = "#{sd("%B")} #{sd("%-d").to_i.ordinalize}"
    string += ", #{sd("%Y")}" if start_date == end_date
    string += " – #{ed("%-d").to_i.ordinalize}, #{sd("%Y")}" if start_date.month == end_date.month
    string += ", #{sd("%Y")}" if start_date == end_date
    string
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
