# frozen_string_literal: true

# Receipt class that holds a list of items
class Receipt
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    items << item
  end
end
