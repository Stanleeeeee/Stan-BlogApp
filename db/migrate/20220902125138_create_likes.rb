class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &t.timestamps
    end
  end
end
