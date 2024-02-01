class CreateBasketballTeam < ActiveRecord::Migration[7.1]
  def change
    create_table :basketball_teams do |t|
      t.string :name
      t.string :city
      t.integer :innaguration_year
      t.boolean :championship
      t.string :conference

      t.timestamps
    end
  end
end
