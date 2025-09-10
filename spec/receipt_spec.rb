# frozen_string_literal: true

require 'receipt'
require 'item'

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
end
