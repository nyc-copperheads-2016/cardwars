class SwapForeignKeyFromDeckToRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :deck_id
    add_column :decks, :round_id, :integer, null: false
  end
end
