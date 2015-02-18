class AddPhotoUrlandBottleNumtoBeers < ActiveRecord::Migration
  def change
    add_column :beers, :photo_url, :text
    add_column :beers, :bottles, :integer
  end
end
