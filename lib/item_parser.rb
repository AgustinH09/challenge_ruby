# frozen_string_literal: true

require_relative 'item'

# Class to parse a line into an Item
class ItemParser
  LINE_ITEM_REGEX = /(\d+)\s(.*)\sat\s(\d+\.\d+)/.freeze

  def self.parse(line)
    match = LINE_ITEM_REGEX.match(line)

    Item.new(
      quantity: match[1].to_i,
      name: match[2],
      price: match[3].to_f
    )
  end
end
