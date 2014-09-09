class Player < ActiveRecord::Base

  belongs_to :pro_team

  has_many :team_player_relationships,
    foreign_key: :selected_player_id,
    dependent: :destroy
  has_many :selecting_teams,
    through: :team_player_relationships


  POSITIONS = [
    "QB",
    "RB",
    "WR",
    "TE",
    "K",
    "DEF"
  ]


  def self.positions
    players = []
    POSITIONS.each do |position|
      players << where(position: position)
    end
    players
  end

  def selected?
    team_player_relationships.exists?
  end

end
