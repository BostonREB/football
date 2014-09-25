class TightendsController < ApplicationController

  def index
    @players = find_tightends
  end

  private

  def find_tightends
    Ranking.where("position == 'TE'").map(&:player)
  end
end
