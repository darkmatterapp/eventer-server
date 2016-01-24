class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true

  def name
    [
      title,
      content[0..50] + "...",
      url
    ].map{ |l| l unless l.blank? }.compact.first
  end
end
