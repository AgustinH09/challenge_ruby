# frozen_string_literal: true

require 'receipt'
require 'item'
require 'tax_calculator'

RSpec.describe Receipt do
  describe '#initialize' do
    it 'starts with an empty list of items' do
      receipt = Receipt.new
      expect(receipt.items).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the receipt' do
      receipt = Receipt.new
      item = Item.new(quantity: 1, name: 'book', price: 11.99)

      receipt.add_item(item)

      expect(receipt.items).to include(item)
    end
  end

  describe 'total calculations' do
    let(:receipt) { Receipt.new }

    before do
      receipt.add_item(Item.new(quantity: 2, name: 'book', price: 12.49))
      receipt.add_item(Item.new(quantity: 1, name: 'music CD', price: 14.99))
      receipt.add_item(Item.new(quantity: 1, name: 'chocolate bar', price: 0.85))
    end

    it 'calculates the correct total sales tax' do
      expect(receipt.total_sales_tax).to eq(1.50)
    end

    it 'calculates the correct grand total' do
      expect(receipt.total_price).to eq(42.32)
    end
  end
end
