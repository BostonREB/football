class RankingsRetriever
  attr_reader :ranking
  FFNERD_API_KEY = ENV.fetch('FFNERD_API_KEY')

  def get_rankings
    rankings = FFNerd.ppr_draft_rankings
    rankings.map do |ranking|
      Ranking.create(ranking_params(ranking))
    end
  end

  private

  def ranking_params(ranking)
    {
      player_id: ranking.playerId.to_i,
      bye_week: ranking.bye_week,
      nerd_rank: ranking.nerd_rank,
      position_rank: ranking.position_rank,
      overall_rank: ranking.overall_rank
    }
  end
end
