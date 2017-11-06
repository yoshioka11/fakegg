class CreateChampions < ActiveRecord::Migration[5.1]
  def change
    create_table :champions do |t|
      t.text :champion
      t.integer :champion_id

      t.timestamps
    end
  end
end
