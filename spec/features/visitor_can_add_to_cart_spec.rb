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
    it "should be able to add multiple accessories to cart" do
      accessory = create(:accessory)

      visit '/bike-shop'

      click_on "Add to Cart"

      expect(page).to have_content("You now have 1 #{accessory.title} in your cart.")
      click_on "Add to Cart"
      expect(page).to have_content("Cart: 2")
    end
  end
end
