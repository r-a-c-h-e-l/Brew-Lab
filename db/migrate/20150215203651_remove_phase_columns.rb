class RemovePhaseColumns < ActiveRecord::Migration
  def change
    remove_column :beers, :phase1
    remove_column :beers, :phase2
    remove_column :beers, :phase3
    remove_column :beers, :phase4
    remove_column :beers, :phase5
    remove_column :beers, :phase6
    remove_column :beers, :current_phase
    add_column :beers, :phaseX, :integer
  end
end
