class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.references :user, foreign_key: true, null: false
      t.references :campaign, foreign_key: true, null: false
    end

    add_index :participants, [:user_id, :campaign_id], unique: true
  end
end
