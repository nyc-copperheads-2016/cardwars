class AddNumberGuessesToRounds < ActiveRecord::Migration
  def change
    # It is probably better to store the Guess information in a table in the
    # database.  This would allow you to recreate/replay history, collect statistics,
    # etc, without trying to maintain a synchronized value in the round which is
    # the effect of having collected those guesses.
    add_column :rounds, :num_guesses, :integer, default: 0
    add_column :rounds, :correct_first_guess, :integer, default: 0
  end
end
