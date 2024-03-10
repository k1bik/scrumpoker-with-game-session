class CreatePokerSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :poker_sessions, id: :uuid do |t|
      t.string :name, null: false
      t.string :friendly_name, null: false, index: {unique: true}
      t.string :estimates, null: false
      t.string :password_digest, null: false
      t.references :creator, null: false, type: :uuid, foreign_key: {to_table: :users, on_delete: :cascade}

      t.timestamps
    end
  end
end
