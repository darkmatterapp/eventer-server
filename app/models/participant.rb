class Participant < ApplicationRecord
  belongs_to :event
  has_many :participations
  has_many :sessions, through: :participations

  validates :name, presence: :true
end
