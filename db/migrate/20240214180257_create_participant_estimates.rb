class CreateParticipantEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :participant_estimates, id: :uuid do |t|
      t.references :game_participant, foreign_key: true, null: false, type: :uuid
      t.string :value, null: false

      t.timestamps
    end
  end
end
