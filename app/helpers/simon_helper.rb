# frozen_string_literal: true

# helper for SimonController
module SimonHelper
  def calc(val)
    [val, (val - 1) * val * (val + 1)]
  end

  def calc_enum(from)
    Enumerator::Lazy.new(from..Float::INFINITY) do |yielder, val|
      yielder << calc(val)
    end
  end

  def collect_res(simon_numbers, fact_sources, facts)
    f = fact_sources.zip(facts)
    simon_numbers.map { |simon_number, fact| [simon_number, f.find { |val| val[1] == fact }[0], fact] }
  end

  def find_simon_numbers(from, to)
    numbers = calc_enum(from).take_while { |val| val[1] <= to }.to_a
    numbers.append(calc(numbers.last[0] + 1)) unless numbers.empty?
    numbers
  end
end
