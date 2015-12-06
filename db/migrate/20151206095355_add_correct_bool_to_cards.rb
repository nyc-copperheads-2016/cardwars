class AddCorrectBoolToCards < ActiveRecord::Migration
  def change
    add_column :cards, :is_answered_correct,:boolean, default: false
  end
end
