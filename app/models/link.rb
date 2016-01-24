class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true

  def name
    [
      title,
      content,
      url
    ].map{ |l| l unless l.blank? }.compact.first
  end
end
