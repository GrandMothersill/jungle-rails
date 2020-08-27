require 'rails_helper'

RSpec.feature "Visitor can navigate from the home page to the product detail page by clicking on a product", type: :feature, js: true do

  # SETUP
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

  scenario "they see one product in detail" do
    # ACT
    visit root_path
    # visit ('about#show')
    
    click_link('Details', match: :first)
    
    # DEBUG / VERIFY
    
    expect(page).to have_css 'article.product-detail', count: 1
    save_screenshot
  end

end
