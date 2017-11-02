class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :sumoner_name
      t.integer :team_id
      t.timestamps
    end
  end
end
