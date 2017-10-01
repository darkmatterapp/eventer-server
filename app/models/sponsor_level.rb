class SponsorLevel < ApplicationRecord
  belongs_to :event
  has_many :sponsors
end
