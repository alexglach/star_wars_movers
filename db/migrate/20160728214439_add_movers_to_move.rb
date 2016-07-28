class AddMoversToMove < ActiveRecord::Migration
  def change
    add_column :moves, :from_movers, :string
    add_column :moves, :to_movers, :string
  end
end
