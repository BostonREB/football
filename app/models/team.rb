class Team < ActiveRecord::Base

  belongs_to :user
  belongs_to :league

  has_many :team_player_relationships,
    foreign_key: :selecting_team_id,
    dependent: :destroy

  has_many :selected_players,
    through: :team_player_relationships

  def pick(player)
    team_player_relationships.create(selected_player_id: player.id)
  end

  def drop(player)
    relationship = TeamPlayerRelationship.where(selected_player_id: player.id)
    relationship.destroy_all
  end

  def member?(player)
    selected_player_ids.include? player.id
  end
end
