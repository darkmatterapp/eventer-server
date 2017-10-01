class Session < ApplicationRecord
  belongs_to :event
  belongs_to :location

  has_many :participations
  has_many :participants, through: :participations

  accepts_nested_attributes_for :participations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: :true

  def time_range
    "#{starts_at.strftime("%H:%M")} - #{ends_at.strftime("%H:%M")}"
  end
end
