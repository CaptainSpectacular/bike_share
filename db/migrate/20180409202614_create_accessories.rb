class CreateAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :accessories do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image, :default => "https://i1.wp.com/thebeautyinyou.mlethadaniels.net/wp-content/uploads/2017/10/Smart-Indoor-Recumbent-Exercise-Bike-JOROTO-MH20-Cardio-Fitness-Cycling-Machine-Home-Stationary-Trainer-with-Pulse-0.jpg?resize=150%2C150"
      t.string :status

      t.timestamps
    end
  end
end
