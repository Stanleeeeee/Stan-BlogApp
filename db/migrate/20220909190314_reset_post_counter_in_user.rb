class ResetPostCounterInUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :posts_counter
    add_column :users, :posts_counter, :integer, default: 0

    # Ex:- :default =>''
  end
end
