class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.string :role
      t.boolean :special_ability
      t.timestamps
    end
  end
end
