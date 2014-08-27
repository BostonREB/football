class PlayerRetriever
  attr_reader :player, :pro_team
  FFNERD_API_KEY = ENV.fetch('FFNERD_API_KEY')

  def get_players
    players = FFNerd.players
    players.map do |player|
      if player_inactive?(player)
        next
      end
      Player.create(player_params(player))
    end
  end

  private

  def player_params(player)
    {
      id: player.playerId.to_i,
      first_name: player.fname,
      last_name: player.lname,
      fullname: player.display_name,
      team: player.team,
      position: player.position
    }
  end

  def player_inactive?(player)
    player.active = 0
  end
end
