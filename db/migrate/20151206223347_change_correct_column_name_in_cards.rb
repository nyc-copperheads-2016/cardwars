class ChangeCorrectColumnNameInCards < ActiveRecord::Migration
  def change
    rename_column :cards, :is_answered_correct, :correct
  end
end
