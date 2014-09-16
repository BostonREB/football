class Projection < ActiveRecord::Base
  belongs_to :player

  def self.by_date
    order("week ASC")
  end
end
