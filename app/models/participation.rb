class Participation < ApplicationRecord
  belongs_to :session
  belongs_to :participant
  belongs_to :role
  belongs_to :event

  validates :session, presence: :true
  validates :participant, presence: :true
  validates :role, presence: :true
  validates :event, presence: :true
end
