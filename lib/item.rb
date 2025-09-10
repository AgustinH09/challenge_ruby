# frozen_string_literal: true

# Simple Item class that has price, quantity, and name
class Item
  attr_reader :name, :price, :quantity

  def initialize(price:, quantity:, name:)
    @price = price
    @quantity = quantity
    @name = name
  end
end
