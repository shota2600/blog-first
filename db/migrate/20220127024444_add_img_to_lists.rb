class AddImgToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :img, :string
  end
end
