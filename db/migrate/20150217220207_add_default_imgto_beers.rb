class AddDefaultImgtoBeers < ActiveRecord::Migration
  def change
    change_column :beers, :photo_url, :text, :default => "/assets/beer_glasses.jpg"
  end
end
