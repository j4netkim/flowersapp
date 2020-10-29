class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :season_name
      t.integer :price
      t.integer :season_id
    end
  end
end
