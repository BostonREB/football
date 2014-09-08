class TeamPlayerRelationship < ActiveRecord::Base
  belongs_to :selecting_team, class_name: "Team"
  belongs_to :selected_player, class_name: "Player"
end
