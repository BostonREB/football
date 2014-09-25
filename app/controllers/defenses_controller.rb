class DefensesController < ApplicationController

  def index
    @players = find_defenses
  end

  private

  def find_defenses
    Ranking.where("position == 'DEF'").map(&:player)
  end
end
