class CreatePeoplePerformances < ActiveRecord::Migration
  def change
    create_table :people_performances, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :performance, index: true
    end
  end
end
