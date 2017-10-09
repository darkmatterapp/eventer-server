class AddSessionIdToMedia < ActiveRecord::Migration[5.1]
  def change
    add_reference :media, :session, foreign_key: true
  end
end
