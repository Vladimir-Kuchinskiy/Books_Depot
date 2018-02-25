class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
