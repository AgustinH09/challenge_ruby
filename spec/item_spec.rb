# frozen_string_literal: true

require 'item'

RSpec.describe Item do
  describe '#initialize' do
    let(:item) { Item.new(name: 'book', quantity: 1, price: 12.49) }

    it 'asigns name' do
      expect(item.name).to eq('book')
    end

    it 'assigns price' do
      expect(item.price).to eq(12.49)
    end

    it 'assigns quantity' do
      expect(item.quantity).to eq(1)
    end
  end
end
