class WiderecieversController < ApplicationController

  def index
    @players = find_receivers
  end

  private

  def find_receivers
    Ranking.where("position == 'WR'").map(&:player)
  end
end
