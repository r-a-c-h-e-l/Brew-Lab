class ChangeColumnBeerNotes < ActiveRecord::Migration
  def change
    change_column :beers, :beer_notes, :text, :default => "add brew details here."
  end
end
