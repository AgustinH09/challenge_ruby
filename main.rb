# frozen_string_literal: true

input = [
  '2 book at 12.49',
  '1 music CD at 14.99',
  '1 chocolate bar at 0.85'
]

total_sales_tax = 0.0
total_price = 0.0

puts 'Output 1:'

input.each do |line|
  /(\d+)\s(.*)\sat\s(\d+\.\d+)/.match(line) do |match|
    quantity = match[1].to_i
    name = match[2]
    shelf_price = match[3].to_f

    is_exempt = name.include?('book') || name.include?('chocolate') || name.include?('pills')

    basic_tax_rate = is_exempt ? 0.0 : 0.10

    tax_per_item = shelf_price * basic_tax_rate

    rounded_tax_per_item = (tax_per_item * 20).ceil / 20.0

    line_item_tax = quantity * rounded_tax_per_item
    total_sales_tax += line_item_tax

    line_item_price = (quantity * shelf_price) + line_item_tax
    total_price += line_item_price

    puts "#{quantity} #{name}: #{'%.2f' % line_item_price}"
  end
end

puts "Sales Taxes: #{'%.2f' % total_sales_tax}"
puts "Total: #{'%.2f' % total_price}"
