class CreateLeagueMemberships < ActiveRecord::Migration
  def change
    create_table :league_memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :league, index: true

      t.timestamps
    end
  end
end
