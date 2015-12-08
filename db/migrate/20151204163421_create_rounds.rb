class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      # Always ensure that DB constraints are in place for any objedct that
      # cannot exist without those attributes being set.
      t.integer :deck_id, null: false

      t.timestamps(null: false)
    end
  end
end
