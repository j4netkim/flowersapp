class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.integer :user_id
      t.string :password_digest
    end
  end
end
