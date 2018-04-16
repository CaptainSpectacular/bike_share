class AddCategoriesToAccessories < ActiveRecord::Migration[5.1]
  def change
    add_reference :accessories, :category, foreign_key: true
  end
end
