class ChangeColumnBeerName < ActiveRecord::Migration
  def change
    change_column :beers, :beer_name, :text, :default => "new beer"
  end
end
