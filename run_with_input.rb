# frozen_string_literal: true

INPUTS = {
  1 => <<~INPUT,
    2 book at 12.49
    1 music CD at 14.99
    1 chocolate bar at 0.85
  INPUT
  2 => <<~INPUT,
    1 imported box of chocolates at 10.00
    1 imported bottle of perfume at 47.50
  INPUT
  3 => <<~INPUT
    1 imported bottle of perfume at 27.99
    1 bottle of perfume at 18.99
    1 packet of headache pills at 9.75
    3 imported boxes of chocolates at 11.25
  INPUT
}.freeze

def run_receipt_calculator(input_text)
  IO.popen('ruby main.rb', 'r+') do |pipe|
    pipe.puts(input_text)
    pipe.close_write
    pipe.read
  end
end

case_number = ARGV[0].to_i

if INPUTS.key?(case_number)
  input_to_run = INPUTS[case_number]
  puts run_receipt_calculator(input_to_run)
else
  puts 'Please provide a valid case number (1, 2, or 3).'
end
