class AddColumnsPhaseArrayTotalPhasestoBeers < ActiveRecord::Migration
  def change
    add_column :beers, :phase_array, :text
    add_column :beers, :total_phases, :integer
  end
end
