class ChangePhaseTableNAmes < ActiveRecord::Migration
  def change
    rename_table :phase1s, :mashes
    rename_table :phase2s, :sparges
    rename_table :phase3s, :boils
    rename_table :phase4s, :chills
    rename_table :phase5s, :ferments
    rename_table :phase6s, :lagers
  end
end
