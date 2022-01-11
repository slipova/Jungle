require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create!(name: "casual")
      @product = Product.create!(name: "old shirt", description: "really old", image: "url", price_cents: 2000, quantity: 26, category_id: @category.id)
    end

    after(:each) do
      @product.errors.full_messages
    end

    describe "@product" do
      it 'should create a new product' do
        expect(@product).to be_valid
      end

      it 'should not exist without a name' do
        @product.name = nil
        expect(@product).to_not be_valid
      end

      it 'should not exist without quantity' do
        @product.quantity = nil
        expect(@product).to_not be_valid
      end

      it 'should not exist without an price_cents' do
        @product.price_cents = nil
        expect(@product).to_not be_valid
      end

      it 'should not exist without a category' do
        @product.category = nil
        expect(@product).to_not be_valid
      end

    end
  end
end
