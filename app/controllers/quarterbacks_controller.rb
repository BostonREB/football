class QuarterbacksController < ApplicationController

  def index
    @players = find_quarterbacks
  end

  private

  def find_quarterbacks
    Ranking.where("position == 'QB'").map(&:player)
  end
end
