class CreatePhase2s < ActiveRecord::Migration
  def change
    create_table :phase2s do |t|
      t.text :temps
      t.integer :user_id
      t.integer :beer_id

      t.timestamps null: false
    end
  end
end
