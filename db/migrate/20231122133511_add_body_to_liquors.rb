class AddBodyToLiquors < ActiveRecord::Migration[6.1]
  def change
    add_column :liquors, :body, :text
  end
end
