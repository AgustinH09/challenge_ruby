# frozen_string_literal: true

require_relative 'tax_calculator'

# Class to print the receipt
class ReceiptPrinter
  class << self
    def print(receipt)
      lines = receipt.items.map { |item| format_line_item(item) }

      lines << "Sales Taxes: #{format_price(receipt.total_sales_tax)}"
      lines << "Total: #{format_price(receipt.total_price)}"

      lines.join("\n")
    end

    private

    def format_line_item(item)
      line_item_tax = TaxCalculator.calculate(item) * item.quantity
      line_item_total = (item.quantity * item.price) + line_item_tax

      "#{item.quantity} #{item.name}: #{format_price(line_item_total)}"
    end

    def format_price(price)
      format('%.2f', price)
    end
  end
end
