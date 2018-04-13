require "rails_helper"

describe "admin visits the admin dashboard" do
  describe "they can access the accessory index" do
    it "should show accessory information and edit options" do
      admin = create(:admin)
      accessory_1 = create(:accessory)
      accessory_2 = create(:accessory_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit "/admin/dashboard"

      click_on "All Accessories"
      expect(current_path).to eq('/admin/bike-shop')
      expect(page).to have_content(accessory_1.title)
      expect(page).to have_content(accessory_1.price)
      expect(page).to have_content(accessory_1.status)
      expect(page).to have_content(accessory_2.title)
      expect(page).to have_content(accessory_2.price)
      expect(page).to have_content(accessory_2.status)
      expect(page).to have_css("img[src*='http://my_string.com/something.png']")
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end
end
