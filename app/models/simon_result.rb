class SimonResult < ApplicationRecord
  has_and_belongs_to_many :simon_intervals

  validates :value, presence: true, uniqueness: true
  validates :n_num, presence: true, uniqueness: true
  validates :n_fact, presence: true, uniqueness: true

  def self.get(from, to)
    interval = SimonInterval.find_by(start: from, end: to)

    if interval.blank?
      interval = SimonInterval.create(start: from, end: to)
    end

    results = interval.simon_results

    if results.blank?
      return generate_simon_numbers(from, to)
    end

    return results.map { |result| [result.value, result.n_num, result.n_fact]}
  end

  def self.collect_res(simon_numbers, fact_sources, facts)
    f = fact_sources.zip(facts)
    simon_numbers.map { |simon_number, fact| [simon_number, f.find { |val| val[1] == fact }[0], fact] }
  end

  def self.generate_simon_numbers(from, to)
    fact_sources = (from..to).to_a
    factorials = fact_sources.map { |val| Math.gamma(val + 1).to_i }

    numbers = collect_res(calc_simon_numbers(factorials), fact_sources, factorials)

    interval = SimonInterval.find_by(start: from, end: to)

    numbers.each do|value, n_num, n_fact|
      result = find_by(value: value)
      if result.blank?
        result = create(value: value, n_num: n_num, n_fact: n_fact)
      end
      interval.simon_results << result
    end

    numbers
  end

  def self.calc(val)
    [val, (val - 1) * val * (val + 1)]
  end

  def self.calc_enum(from)
    Enumerator::Lazy.new(from..Float::INFINITY) do |yielder, val|
      yielder << calc(val)
    end
  end

  def self.calc_simon_numbers(factorials)
    from = factorials.first
    to = factorials.last

    find_simon_numbers(from, to).select { |val| factorials.include? val[1] }
  end

  def self.find_simon_numbers(from, to)
    numbers = calc_enum(from).take_while { |val| val[1] <= to }.to_a
    numbers.append(calc(numbers.last[0] + 1)) unless numbers.empty?
    numbers
  end
end
