class Link < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :url, presence: true

  before_update :ensure_protocol
  before_create :ensure_protocol

  PROTOCOL_REGEX = /^https*:\/\//

  def name
    [
      title,
      content[0..50] + "...",
      url
    ].map{ |l| l unless l.blank? }.compact.first
  end

  def ensure_protocol
    unless self.url =~ PROTOCOL_REGEX
      self.url = "http://#{self.url}"
    end
  end
end
