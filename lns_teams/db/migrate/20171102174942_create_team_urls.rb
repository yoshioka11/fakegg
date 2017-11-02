class CreateTeamUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :team_urls do |t|
      t.string :team_url
      t.integer :team_id
      t.timestamps
    end
  end
end
