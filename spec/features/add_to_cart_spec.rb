require 'rails_helper'

RSpec.feature "User adds item to cart", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

    end
  end

  scenario "Update cart" do
    # # ACT

    visit root_path

    page.find(('div[data-testid="add-to-cart"]'), match: :first).click()
  
    
    # # DEBUG / VERIFY
    
    expect(page).to have_text 'My Cart (1)'
    save_screenshot
  end

end