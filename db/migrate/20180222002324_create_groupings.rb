class CreateGroupings < ActiveRecord::Migration[5.1]
  def change
    create_table :groupings do |t|
      t.belongs_to :book, index: true
      t.belongs_to :group, index: true
      t.timestamps
    end
  end
end
