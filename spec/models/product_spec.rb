require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new(name: "New Category")
      @category.save
      @product = Product.new(
        name: "Best Plant",
        price: 24000,
        quantity: 10,
        category_id: @category.id,
      )
    end

    it "validates that a product is valid" do
      @product.save
      expect(@product).to be_valid
    end

    it "validates that a product name is present" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "validates that a product price is present" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "validates that a product quantity is present" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "validates that a product category is present" do
      @product.category_id = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
