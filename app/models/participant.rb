class Participant < ApplicationRecord
  belongs_to :event
  has_and_belongs_to_many :sessions
  has_many :participations

  validates :name, presence: :true
end
