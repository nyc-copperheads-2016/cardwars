class AddNumIncorrectColumnInCards < ActiveRecord::Migration
  def change
    add_column :cards, :incorrect_guesses, :integer, default: 0, null: false
  end
end
