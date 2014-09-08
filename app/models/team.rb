class Team < ActiveRecord::Base

  belongs_to :user

  has_many :players

  has_many :team_player_relationships,
    foreign_key: :selecting_team_id,
    dependent: :destroy

  has_many :selected_players,
    through: :team_player_relationships


  def pick(player)
    team_player_relationships.create(selected_player_id: player.id)
  end

  def drop(player)
    team_player_relationships.destroy(player)
  end
end
