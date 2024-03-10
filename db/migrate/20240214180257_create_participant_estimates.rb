class CreateParticipantEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :participant_estimates, id: :uuid do |t|
      t.references :poker_session_participant, null: false, type: :uuid, foreign_key: {on_delete: :cascade}
      t.string :value, null: false

      t.timestamps
    end
  end
end
