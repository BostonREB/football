class DefensesController < ApplicationController

  def index
    @players = find_defenses
  end

  private

  def find_defenses
    Player.where(position: "DEF")
  end
end
