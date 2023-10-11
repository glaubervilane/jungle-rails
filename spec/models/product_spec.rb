require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a product with all four fields set' do
      category = Category.new(name: 'Category Name')
      product = Product.new(
        name: 'Product Name',
        price: 10.00,
        quantity: 5,
        category: category
      )
      expect(product).to be_valid
    end

    it 'should not save a product without a name' do
      category = Category.new(name: 'Category Name')
      product = Product.new(
        price: 10.00,
        quantity: 5,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save a product without a price' do
      category = Category.new(name: 'Category Name')
      product = Product.new(
        name: 'Product Name',
        quantity: 5,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save a product without a quantity' do
      category = Category.new(name: 'Category Name')
      product = Product.new(
        name: 'Product Name',
        price: 10.00,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save a product without a category' do
      product = Product.new(
        name: 'Product Name',
        price: 10.00,
        quantity: 5
      )
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
