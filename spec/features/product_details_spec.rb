require 'rails_helper'

RSpec.feature "users navigate from home page to product detail page by clicking on a product", type: :feature, js: true do


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

  scenario "They see product details page" do
    # # ACT

    visit root_path

    page.find(".pull-right", match: :first).click()
  
    
    # # DEBUG / VERIFY
    
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end

end