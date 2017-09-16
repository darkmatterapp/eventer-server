class Session < ApplicationRecord
  belongs_to :event
  belongs_to :location
  has_many :participations
  has_and_belongs_to_many :people # TEMP TODO delete this when participations is working

  validates :name, presence: :true
end
