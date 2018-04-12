require 'rails_helper'

describe "user adds an accessory to cart" do
  context "user visits bike shop" do
    it "should be able to add an accessory to cart" do
      accessory = create(:accessory)

      visit '/bike-shop'

      click_on "Add to Cart"

      expect(page).to have_content("You now have 1 #{accessory.title} in your cart.")
      visit stations_path
      expect(page).to have_content("1")

      visit root_path
      click_on "Create Account"

      fill_in "user[username]", with: "Batman"
      fill_in "user[password]", with: "Robin"
      click_on "Sign Up"

      visit '/cart'

      expect(page).to have_content("1")
      expect(page).to have_content("Quantity: 1")
    end
    it "can click_button to add 1 to quantity" do
      accessory = create(:accessory)

      visit '/bike-shop'

      click_on "Add to Cart"

      click_on "Add 1"
      expect(page).to have_content("2")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: 19.98")
      expect(page).to have_content("Total: 19.98")

      click_on "Add 1"
      expect(page).to have_content("3")
      expect(page).to have_content("Quantity: 3")
      expect(page).to have_content("Subtotal: 29.97")
      expect(page).to have_content("Total: 29.97")
    end
    it "can click_button to subtract 1 to quantity" do
      accessory = create(:accessory)

      visit '/bike-shop'
      click_on 'Add to Cart'
      visit '/cart'

      click_on "Add 1"
      click_on "Add 1"
      click_on "Add 1"
      click_on "Subtract 1"

      expect(page).to have_content("3")
      expect(page).to have_content("Quantity: 3")
      expect(page).to have_content("Subtotal: 29.97")
      expect(page).to have_content("Total: 29.97")

      click_on "Subtract 1"
      expect(page).to have_content("2")
      expect(page).to have_content("Quantity: 2")
      expect(page).to have_content("Subtotal: 19.98")
      expect(page).to have_content("Total: 19.98")

      click_on "Subtract 1"
      expect(page).to have_content("1")
      expect(page).to have_content("Quantity: 1")
      expect(page).to have_content("Subtotal: 9.99")
      expect(page).to have_content("Total: 9.99")
    end
    it "can click_button to subtract 1 to quantity" do
      accessory = create(:accessory)

      visit '/bike-shop'
      click_on 'Add to Cart'
      visit '/cart'
      click_on "Add 1"
      click_on "Add 1"
      click_on "Add 1"

      click_on "Remove Accessory from Cart"

      "You removed #{accessory.title} from your cart."
      expect(current_path).to eq("/cart")
      expect(page).to have_content("0")
      expect(page).to_not have_content("Quantity: ")
      expect(page).to_not have_content("Subtotal: ")
      expect(page).to have_content("Total: 0")
    end
  end
end
