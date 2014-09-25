class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.belongs_to :player, index: true
      t.integer :bye_week
      t.integer :nerd_rank
      t.integer :position_rank
      t.integer :overall_rank

      t.timestamps
    end
  end
end
