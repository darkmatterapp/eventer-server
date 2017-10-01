class AdjustSponsorsToBelongToSponsorLevels < ActiveRecord::Migration[5.1]
  def change
    remove_reference :sponsors, :event, index: true, foreign_key: true
    add_reference :sponsors, :sponsor_level, foreign_key: true
  end
end
