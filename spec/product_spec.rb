require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    before do
      @product = Product.new(
        :name => 'BOB', 
        :price_cents => 4000, 
        :quantity => 4, 
        :category_id => 1
        )
        @category = Category.new(
          :name => 'Tester'
        )

    end

    it "is valid with valid attributes" do
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "is not valid without a linked category" do
      @product.category_id = nil
      expect(@product).to_not be_valid
    end

  end
end