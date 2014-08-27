class CreateProTeams < ActiveRecord::Migration
  def change
    create_table :pro_teams do |t|
      t.string :code
      t.string :full_name
      t.string :location

      t.timestamps
    end
  end
end
