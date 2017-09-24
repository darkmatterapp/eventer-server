class Session < ApplicationRecord
  belongs_to :event
  belongs_to :location

  has_many :participations
  has_many :participants, through: :participations

  validates :name, presence: :true
end
