class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id
      # Reserve TEXT type fields for REALLY large amounts of text.  Data is stored
      # differently and not as efficiently for TEXT fields.
      t.text :question, { null: false }
      t.string :answer, { null: false }

      t.timestamps(null: false)
    end
  end
end
