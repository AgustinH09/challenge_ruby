# frozen_string_literal: true

require_relative 'lib/item_parser'
require_relative 'lib/receipt'
require_relative 'lib/receipt_printer'

receipt = Receipt.new

ARGF.each_line do |line|
  break if line.strip.empty?

  item = ItemParser.parse(line)
  receipt.add_item(item)
rescue ArgumentError => e
  puts e.message
  puts 'Skipping line, to finish press enter'
end

output = ReceiptPrinter.print(receipt)
puts output
