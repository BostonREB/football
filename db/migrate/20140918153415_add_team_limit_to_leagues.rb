class AddTeamLimitToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :team_limit, :integer
  end
end
