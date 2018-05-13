class AddReadingNowToBooks < ActiveRecord::Migration[5.1]
  def change

    add_column :books, :reading_now, :integer

  end
end
