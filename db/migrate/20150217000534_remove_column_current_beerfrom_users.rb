class RemoveColumnCurrentBeerfromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :currentBeer
  end
end
