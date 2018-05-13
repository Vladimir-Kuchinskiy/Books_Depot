class RemoveSpecialAbilityFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :special_ability, :boolean
  end
end
