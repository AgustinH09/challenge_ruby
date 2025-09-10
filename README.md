# Sales Tax Calculator

Small command-line application written in Ruby that calculates sales tax for a list of items and generate a formatted receipt.

---

## Problem Statement

The application processes shopping items to produce a receipt.
The receipt should list each item's name and price including tax, followed by the total sales tax paid and the total cost.

The tax rules are:

- **Basic Sales Tax**: 10% on all goods, except for exempt items
- **Exempt Items**: Books, food, and medical products are exempt from basic sales tax.
- **Import Duty**: An additional 5% tax on all imported goods, with no exemptions.
- **Rounding Rule**: All tax amounts are rounded up to the nearest 0.05.

---

## Object-Oriented Design

- `Item`: A simple data object representing an item (price, name and quantity).
- `ItemParser`: Responsible only for parsing a line of text into an `Item` object.
- `TaxCalculator`: This class is responsible for calculating the tax for a given item based on all rules
- `Receipt`: Manages a collection of `Item` objects and uses the `TaxCalculator` to determine the total tax and final price
- `ReceiptPrinter`: Responsible only for formatting a completed `Receipt` object into a human readable string.

---

## Prerequisites

- Ruby (3.2.2 works)
- Bundler (for installing RSpec)

---

## How to Run

### 1\. Setup

First, install the rspec, if not installed already.

```bash
gem install rspec
```

### 2\. Run the Tests

To verify that everything is working correctly, run the RSpec test suite.

```bash
rspec
```

### 3\. Run the Application

The application can be run for any of the three specific test cases using the `run_specific_case.rb` file. It accepts a single argument: the case number (1, 2, or 3).

**Example (running Input 3):**

```bash
ruby run_specific_case.rb 3
```

**Output for Input 3:**

```
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
3 imported boxes of chocolates: 35.55
Sales Taxes: 7.90
Total: 98.38
```

The `main.rb` file is designed to work as a command-line tool, reading from standard input. To run and input:

```bash
ruby main.rb
```

## Next Steps

1. Small refactor to avoid re-calculations of some values
