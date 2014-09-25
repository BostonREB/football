class AddPositionToRanking < ActiveRecord::Migration
  def change
    add_column :rankings, :position, :string
  end
end
