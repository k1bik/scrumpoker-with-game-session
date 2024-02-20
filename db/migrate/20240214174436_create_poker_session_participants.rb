class CreatePokerSessionParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :poker_session_participants, id: :uuid do |t|
      t.references :user, foreign_key: true, null: false, type: :uuid
      t.references :poker_session, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
