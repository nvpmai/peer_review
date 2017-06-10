class AddIsOpenToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :is_open, :boolean, default: true
  end
end
