class CreateGameParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :game_participants, id: :uuid do |t|
      t.references :user, foreign_key: true, null: false, type: :uuid
      t.references :game, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end
  end
end
