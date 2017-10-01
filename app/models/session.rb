class Session < ApplicationRecord
  belongs_to :event
  belongs_to :location

  has_many :participations
  has_many :participants, through: :participations

  accepts_nested_attributes_for :participations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: :true
end
