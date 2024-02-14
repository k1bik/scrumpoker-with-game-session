class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games, id: :uuid do |t|
      t.string :name, null: false
      t.string :estimates, null: false
      t.references :creator, null: false, type: :uuid, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
