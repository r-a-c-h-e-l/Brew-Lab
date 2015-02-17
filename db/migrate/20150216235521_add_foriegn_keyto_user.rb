class AddForiegnKeytoUser < ActiveRecord::Migration
  def change
    remove_column :users, :current_beer
    add_column :users, :beer_id, :integer
    add_foreign_key :users, :beers
  end
end
