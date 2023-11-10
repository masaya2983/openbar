class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
