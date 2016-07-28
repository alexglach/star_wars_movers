class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|

      t.string :name
      t.date :date
      t.string :from
      t.string :to
      t.string :vehicle

      t.timestamps null: false
    end
  end
end
