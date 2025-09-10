# frozen_string_literal: true

# spec/tax_calculator_spec.rb

require 'tax_calculator'
require 'item'

RSpec.describe TaxCalculator do
  describe '.calculate' do
    subject { described_class.calculate(item) }

    let(:item) { Item.new(quantity: 1, name: item_name, price: 10.00) }
    let(:item_name) { 'music CD' }

    context 'for a exempt item' do
      context 'when item is imported' do
        let(:item_name) { 'imported box of chocolates' }

        it 'applies a 5% of tax' do
          expect(subject).to eq(0.50)
        end
      end

      context 'for a non-imported item' do
        let(:item_name) { 'box of chocolates' }

        it 'has no tax' do
          expect(subject).to eq(0.0)
        end
      end
    end

    context 'for an imported item' do
      let(:item_name) { 'imported bottle of perfume' }

      it 'applies a 15% of tax' do
        expect(subject).to eq(1.55)
      end
    end

    it 'applies a 10% of tax' do
      expect(subject).to eq(1.0)
    end

    context 'for an item that needs to apply the rounding rule' do
      let(:item) { Item.new(quantity: 1, name: 'music CD', price: 14.99) }

      it 'rounds up to the nearest 0.05' do
        expect(subject).to eq(1.50)
      end
    end
  end
end
