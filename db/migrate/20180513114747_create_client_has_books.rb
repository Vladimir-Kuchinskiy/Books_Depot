class CreateClientHasBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :client_has_books do |t|
      t.belongs_to :client, index: true
      t.belongs_to :book, index: true
      t.timestamps
    end
  end
end
