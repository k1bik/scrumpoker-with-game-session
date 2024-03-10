class CreatePokerSessionParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :poker_session_participants, id: :uuid do |t|
      t.references :user, null: false, type: :uuid, foreign_key: {on_delete: :cascade}
      t.references :poker_session, null: false, type: :uuid, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
