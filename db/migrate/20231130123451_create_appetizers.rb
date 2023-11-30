class CreateAppetizers < ActiveRecord::Migration[6.1]
  def change
    create_table :appetizers do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
