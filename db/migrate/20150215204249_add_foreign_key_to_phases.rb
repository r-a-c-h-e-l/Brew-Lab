class AddForeignKeyToPhases < ActiveRecord::Migration
  def change
    add_foreign_key :phase1, :users
    add_foreign_key :phase1, :beers
    add_foreign_key :phase2, :users
    add_foreign_key :phase2, :beers
    add_foreign_key :phase3, :users
    add_foreign_key :phase3, :beers
    add_foreign_key :phase4, :users
    add_foreign_key :phase4, :beers
    add_foreign_key :phase5, :users
    add_foreign_key :phase5, :beers
    add_foreign_key :phase6, :users
    add_foreign_key :phase6, :beers
  end
end
