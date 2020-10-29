class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :name
    end
  end
end
