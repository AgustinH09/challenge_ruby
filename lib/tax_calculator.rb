# frozen_string_literal: true

# Calculates sales tax for items based on
# their name and price.
class TaxCalculator
  BASIC_TAX_RATE = 0.10
  IMPORT_TAX_RATE = 0.05
  EXEMPT_KEYWORDS = %w[book chocolate pills].freeze

  class << self
    def calculate(item)
      tax_rate = calculate_tax_rate(item)
      unrounded_tax = item.price * tax_rate
      round_up(unrounded_tax)
    end

    private

    def calculate_tax_rate(item)
      rate = 0.0
      rate += BASIC_TAX_RATE unless exempt?(item)
      rate += IMPORT_TAX_RATE if imported?(item)
      rate
    end

    def exempt?(item)
      EXEMPT_KEYWORDS.any? { |keyword| item.name.include?(keyword) }
    end

    def imported?(item)
      item.name.include?('imported')
    end

    def round_up(value)
      (value * 20).ceil / 20.0
    end
  end
end
