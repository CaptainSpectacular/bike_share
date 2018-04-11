require 'rails_helper'

describe 'as a visitor' do
  scenario 'visits cart and sees all items they added' do
    accessory_1 = create(:accessory)

    visit '/bike-shop'

    click_on 'Add to Cart'

    visit '/cart'

    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content(accessory_1.price)
    expect(page).to have_content(accessory_1.image)

    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Subtotal: 9.99")
    expect(page).to have_content("Cart Total: 9.99")
  end
end
