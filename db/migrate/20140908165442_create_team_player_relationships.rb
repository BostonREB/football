class CreateTeamPlayerRelationships < ActiveRecord::Migration
  def change
    create_table :team_player_relationships do |t|
      t.belongs_to :selecting_team, index: true
      t.belongs_to :selected_player, index: true

      t.timestamps
    end
  end
end
