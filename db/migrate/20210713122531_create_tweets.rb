class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text        :text, null: false
      t.references  :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tweets, [:user_id, :created_at]
  end
end
