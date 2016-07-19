class Participation < ApplicationRecord
  belongs_to :performance
  belongs_to :person
  belongs_to :role
  belongs_to :event

  validates :performance, presence: :true
  validates :person,      presence: :true
  validates :role,        presence: :true
  validates :event,       presence: :true
end
