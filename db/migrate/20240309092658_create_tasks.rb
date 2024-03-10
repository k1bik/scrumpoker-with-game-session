class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.references :poker_session, null: false, type: :uuid, foreign_key: {on_delete: :cascade}
      t.text :description, null: false

      t.timestamps
    end
  end
end
