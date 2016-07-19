class AddCodeOfConductToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :code_of_conduct, :text
  end
end
