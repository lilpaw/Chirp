class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :stalker_id
      t.integer :prey_id

      t.timestamps
    end
  end
end
