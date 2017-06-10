class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :content, null: false
      t.integer :giver_id, null: false
      t.integer :receiver_id, null: false
      t.references :campaign, foreign_key: true, null: false

      t.timestamps
    end

    add_index :feedbacks, [:giver_id, :receiver_id, :campaign_id], unique: true
  end
end
