class Performance < ActiveRecord::Base
  validates :name, presence: :true

  belongs_to :event
  # has_and_belongs_to_many :people
end
