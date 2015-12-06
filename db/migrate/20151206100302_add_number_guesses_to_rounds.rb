class AddNumberGuessesToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :num_guesses, :integer, default: 0
    add_column :rounds, :correct_first_guess, :integer, default: 0
  end
end
