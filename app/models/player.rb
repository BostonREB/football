class Player < ActiveRecord::Base
  # attr_reader :pro_team

  belongs_to :pro_team

  def active?(player)
    player.active == 1
  end
end
