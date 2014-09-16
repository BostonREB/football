class ProjectionsRetriever
  attr_reader :projection
  FFNERD_API_KEY = ENV.fetch('FFNERD_API_KEY')

  def get_projections
    POSITIONS.first(5).each do |position|
      projections = FFNerd.weekly_projections(position)
      projections.map do |projection|
        Projection.create(projection_params(projection))
      end
    end
  end

  private

  def projection_params(projection)
    {
      player_id: projection.playerId.to_i,
      week: projection.week,
      pass_att: projection.pass_att,
      pass_comp: projection.pass_cmp,
      pass_yds: projection.pass_yds,
      pass_td: projection.pass_td,
      pass_int: projection.pass_int,
      rush_att: projection.rush_att,
      rush_yds: projection.rush_yds,
      rush_td: projection.rush_td,
      fumbles_lost: projection.fumbles_lost,
      receptions: projection.receptions,
      rec_yds: projection.rec_yds,
      rec_td: projection.rec_td,
      fg: projection.fg,
      xp: projection.xp,
      def_int: projection.def_int,
      def_fum_recovery: projection.def_fr,
      def_sack: projection.def_sack,
      def_td: projection.def_td,
      def_return_td: projection.def_ret_td,
      def_safety: projection.def_safety,
      def_points_allowed: projection.def_pa,
      def_yds_allowed: projection.def_yds_allowed
    }
  end
end
