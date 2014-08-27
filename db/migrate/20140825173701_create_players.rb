class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :fullname, index: true
      t.string :team, index: true
      t.belongs_to :pro_team, index: true, default: 0
      t.string :position, index: true

      t.timestamps
    end
  end
end
