class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :beer_name
      t.text :beer_type
      t.integer :user_id
      t.text :phase1
      t.text :phase2 
      t.text :phase3
      t.text :phase4
      t.text :phase5
      t.text :phase6
      t.text :current_phase

      t.timestamps null: false
    end
  end
end
