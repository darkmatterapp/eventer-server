class Rsvp < ApplicationRecord
  belongs_to :person
  belongs_to :event

  validates :attending, presence: :true
  validates :person_id, presence: :true

  def yes?
    attending == 1
  end

  def maybe?
    attending == 0
  end

  def no?
    attending == -1
  end
end
