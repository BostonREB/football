class Player < ActiveRecord::Base

  belongs_to :pro_team

  POSITIONS = [
    "QB",
    "RB",
    "WR",
    "TE",
    "K",
    "DEF"
  ]

  def active?(player)
    player.active == 1
  end

  def self.positions
    players = []
    POSITIONS.each do |position|
      players << where(position: position)
    end
    players
  end
end
