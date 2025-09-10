# frozen_string_literal: true

require 'item_parser'
require 'item'

RSpec.describe ItemParser do
  describe '.parse' do
    it 'correctly parses a line of text into an Item ' do
      line = '2 book at 12.49'
      item = ItemParser.parse(line)

      expect(item).to be_a(Item)
      expect(item.quantity).to eq(2)
      expect(item.name).to eq('book')
      expect(item.price).to eq(12.49)
    end

    it 'correctly parses a line with an imported item' do
      line = '1 imported box of chocolates at 10.00'
      item = ItemParser.parse(line)

      expect(item).to be_a(Item)
      expect(item.quantity).to eq(1)
      expect(item.name).to eq('imported box of chocolates')
      expect(item.price).to eq(10.00)
    end
  end
end
