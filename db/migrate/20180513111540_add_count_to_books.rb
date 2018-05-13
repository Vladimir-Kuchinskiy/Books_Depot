class AddCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :count, :integer
  end
end
