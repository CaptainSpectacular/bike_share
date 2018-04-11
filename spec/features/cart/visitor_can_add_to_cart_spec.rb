require 'rails_helper'

describe "user adds an accessory to cart" do
  context "user visits bike shop" do
    it "should be able to add an accessory to cart" do
      accessory = create(:accessory)

      visit '/bike-shop'

      click_on "Add to Cart"

      expect(page).to have_content("You now have 1 #{accessory.title} in your cart.")
      visit stations_path
      expect(page).to have_content("Cart: 1")
    end
    it "can click_button to add 1 to quantity" do
      accessory = create(:accessory)

      visit '/bike-shop'

      click_on "Add to Cart"

      click_on "Add 1"
      expect(page).to have_content("Cart: 2")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: 19.98")
      expect(page).to have_content("Total: 19.98")

      click_on "Add 1"
      expect(page).to have_content("Cart: 3")
      expect(page).to have_content("Quantity: 3")
      expect(page).to have_content("Subtotal: 29.97")
      expect(page).to have_content("Total: 29.97")
    end
  end
end
