class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.belongs_to :player, index: true
      t.integer :week
      t.integer :pass_att
      t.integer :pass_comp
      t.integer :pass_yds
      t.integer :pass_td
      t.integer :pass_int
      t.integer :rush_att
      t.integer :rush_yds
      t.integer :rush_td
      t.integer :fumbles_lost
      t.integer :receptions
      t.integer :rec_yds
      t.integer :rec_td
      t.integer :fg
      t.integer :xp
      t.integer :def_int
      t.integer :def_fum_recovery
      t.integer :def_sack
      t.integer :def_td
      t.integer :def_return_td
      t.integer :def_safety
      t.integer :def_points_allowed
      t.integer :def_yds_allowed

      t.timestamps
    end
  end
end
