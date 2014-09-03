class TightendsController < ApplicationController

  def index
    @players = find_tightends
  end

  private

  def find_tightends
    Player.where(position: "TE")
  end
end
