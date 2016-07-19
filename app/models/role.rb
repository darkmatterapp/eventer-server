class Role < ApplicationRecord
  belongs_to :event
  has_many :participations

  validates :name, presence: :true
end
