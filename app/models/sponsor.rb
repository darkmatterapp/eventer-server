class Sponsor < ApplicationRecord
  belongs_to :event
  belongs_to :sponsor_level
end
