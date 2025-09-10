# frozen_string_literal: true

require 'receipt_printer'
require 'receipt'
require 'item'

RSpec.describe ReceiptPrinter do
  describe '.print' do
    it 'formats the receipt into the correct output string' do
      receipt = Receipt.new
      receipt.add_item(Item.new(quantity: 2, name: 'book', price: 12.49))
      receipt.add_item(Item.new(quantity: 1, name: 'music CD', price: 14.99))
      receipt.add_item(Item.new(quantity: 1, name: 'chocolate bar', price: 0.85))

      expected_output = <<~OUTPUT.chomp
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      OUTPUT

      expect(ReceiptPrinter.print(receipt)).to eq(expected_output)
    end
  end
end
