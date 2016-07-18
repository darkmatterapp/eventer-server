class Participation < ApplicationRecord
  belongs_to :performance
  belongs_to :person
  belongs_to :role
  belongs_to :event
end
