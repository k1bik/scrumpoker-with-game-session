class AddSlugToPokerSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :poker_sessions, :slug, :string
    add_index :poker_sessions, :slug, unique: true
  end
end
