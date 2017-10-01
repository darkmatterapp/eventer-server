class Participant < ApplicationRecord
  belongs_to :event
  has_many :participations
  has_many :sessions, through: :participations

  validates :name, presence: :true

  def role_for(session)
    Participation.find_by(session: session, participant: self).role.name
  end
end
