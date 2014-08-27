class Player < ActiveRecord::Base
  # attr_reader :pro_team

  belongs_to :pro_team
end
