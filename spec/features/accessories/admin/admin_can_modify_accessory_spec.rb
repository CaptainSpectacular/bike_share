require "rails_helper"

describe "admin goes to the accessory index page" do
  describe "admin can edit an accessory" do
    it "should edit the accessory" do
      accessory = create(:accessory)
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      click_on "Edit"
      fill_in "accessory[title]", with: "new accessory"
      fill_in "accessory[price]", with: 5
      fill_in "accessory[description]", with: "a new description"
      select "active", :from => "accessory[status]"
      click_on "Update Accessory"

      expect(current_path).to eq(accessory_path(accessory))
      expect(page).to have_content("new accessory")
      expect(page).to have_content(5)
      expect(page).to have_content("a new description")
      expect(page).to have_content("active")
    end
  end
  describe "it can delete an accessory" do
    it "should edit the accessory" do
      accessory = create(:accessory)
      admin = create(:admin)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_bike_shop_path

      click_on "Delete"

      expect(current_path).to eq(bike_shop_path)
      expect(page).to have_content("#{accessory.title} was deleted!")
    end
  end
end
