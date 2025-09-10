# frozen_string_literal: true

require 'receipt_printer'
require 'receipt'
require 'item'

RSpec.describe ReceiptPrinter do
  describe '.print' do
    it 'formats the receipt for Input 1 correctly' do
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

    it 'formats the receipt for Input 2 correctly' do
      receipt = Receipt.new
      receipt.add_item(Item.new(quantity: 1, name: 'imported box of chocolates', price: 10.00))
      receipt.add_item(Item.new(quantity: 1, name: 'imported bottle of perfume', price: 47.50))

      expected_output = <<~OUTPUT.chomp
        1 imported box of chocolates: 10.50
        1 imported bottle of perfume: 54.65
        Sales Taxes: 7.65
        Total: 65.15
      OUTPUT

      expect(ReceiptPrinter.print(receipt)).to eq(expected_output)
    end

    it 'formats the receipt for Input 3 correctly' do
      receipt = Receipt.new
      receipt.add_item(Item.new(quantity: 1, name: 'imported bottle of perfume', price: 27.99))
      receipt.add_item(Item.new(quantity: 1, name: 'bottle of perfume', price: 18.99))
      receipt.add_item(Item.new(quantity: 1, name: 'packet of headache pills', price: 9.75))
      receipt.add_item(Item.new(quantity: 3, name: 'imported boxes of chocolates', price: 11.25))

      expected_output = <<~OUTPUT.chomp
        1 imported bottle of perfume: 32.19
        1 bottle of perfume: 20.89
        1 packet of headache pills: 9.75
        3 imported boxes of chocolates: 35.55
        Sales Taxes: 7.90
        Total: 98.38
      OUTPUT

      expect(ReceiptPrinter.print(receipt)).to eq(expected_output)
    end
  end
end
