class AddIsFakeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_fake, :boolean, default: false
  end
end
