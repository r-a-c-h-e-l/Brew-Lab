class AddFKtoUsers < ActiveRecord::Migration
  def change
    add_foreign_key :beers, :users
  end
end
