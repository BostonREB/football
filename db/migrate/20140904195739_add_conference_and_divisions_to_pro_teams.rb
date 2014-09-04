class AddConferenceAndDivisionsToProTeams < ActiveRecord::Migration
  def change
    add_column :pro_teams, :conference, :string
    add_column :pro_teams, :division, :string
  end
end
