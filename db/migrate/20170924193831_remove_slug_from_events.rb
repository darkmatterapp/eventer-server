class RemoveSlugFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :slug, :string
  end
end
