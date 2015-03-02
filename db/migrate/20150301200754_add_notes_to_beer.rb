class AddNotesToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :beer_notes, :text
  end
end
