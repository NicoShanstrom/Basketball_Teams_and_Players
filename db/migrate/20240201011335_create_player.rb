class CreatePlayer < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :jersey_number
      t.integer :year_drafted
      t.boolean :all_star
      t.references :basketball_team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
