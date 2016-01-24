class Medium < ActiveRecord::Base
  belongs_to :user

  def display_name
    "DISPLAY NAME"
  end
end
