# frozen_string_literal: true

require_relative 'tax_calculator'

# Receipt class that holds a list of items
class Receipt
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end

  def total_sales_tax
    @items.sum do |item|
      TaxCalculator.calculate(item) * item.quantity
    end.round(2)
  end

  def total_price
    total = @items.sum { |item| item.price * item.quantity }
    total + total_sales_tax
  end
end
