class Session < ApplicationRecord
  belongs_to :event
  belongs_to :location

  has_many :participations
  has_many :participants, through: :participations

  has_many :media  # used by photos, audio, video
  has_many :audios # uses media
  has_many :photos # uses media
  has_many :videos # uses media

  accepts_nested_attributes_for :participations,
    reject_if: proc { |params| params['participant_id'].blank? || params['role_id'].blank? },
    allow_destroy: true

  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: :true

  scope :active, -> { joins(:participations).where("participations.participant_id IS NOT NULL")}

  def break?
    participants.empty?
  end

  def time_range
    "#{starts_at.strftime("%H:%M")} - #{ends_at.strftime("%H:%M")}"
  end
end
