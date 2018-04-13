class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
