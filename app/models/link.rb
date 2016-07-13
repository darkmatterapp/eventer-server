class Link < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  validates :url, presence: true

  def name
    [
      title,
      content[0..50] + "...",
      url
    ].map{ |l| l unless l.blank? }.compact.first
  end
end
