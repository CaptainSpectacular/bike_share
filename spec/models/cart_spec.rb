require 'rails_helper'

describe Cart do
  describe "#total_accessory_count" do
    it "can calculate the total number of accessory it holds" do
      cart = Cart.new({"1" => 2, "2" => 3})

      expect(cart.total_accessory_count).to eq(5)
    end
    it "can add an accessory" do
      accessory = create(:accessory)
      cart = Cart.new(nil)

      expect(cart.contents[accessory.id.to_s]).to eq(0)
      cart.add_accessory(accessory)

      expect(cart.contents[accessory.id.to_s]).to eq(1)
    end
  end
end
