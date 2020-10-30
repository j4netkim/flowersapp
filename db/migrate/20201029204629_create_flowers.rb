class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :flower_name
    end
  end
end
