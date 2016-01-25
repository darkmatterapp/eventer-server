class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: :true, on: :create
  validates :email,    presence: :true, uniqueness: true, on: [:create, :update]

  has_many :events
  has_many :venues
  has_many :people
  has_many :performances
  has_many :media
  has_many :photos
  has_many :audios
  has_many :videos
  has_many :links
end
