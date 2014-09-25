class KickersController < ApplicationController

  def index
    @players = find_kickers
  end

  private

  def find_kickers
    Ranking.where("position == 'K'").map(&:player)
  end
end
