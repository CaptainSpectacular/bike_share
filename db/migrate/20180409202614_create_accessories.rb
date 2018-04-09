class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :title
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
