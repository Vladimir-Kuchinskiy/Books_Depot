class RemovePriceFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :price, :decimal
  end
end
