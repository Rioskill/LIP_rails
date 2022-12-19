require 'rails_helper'

RSpec.describe SimonResult, type: :model do
  it 'should add record to database' do
    SimonResult.create(value: 2, n_num: 3, n_fact: 6)

    found = SimonResult.find_by(value: 2)

    expect(found).not_to be_nil

    expect(found.value).to eq(2)
    expect(found.n_num).to eq(3)
    expect(found.n_fact).to eq(6)
  end

  it 'should not create duplicates' do
    SimonResult.create(value: 2, n_num: 3, n_fact: 6)

    record = SimonResult.create(value: 2, n_num: 3, n_fact: 6)
    expect(record).not_to be_valid
  end

  it 'should generate correct results' do
    SimonResult.get(1, 10)

    result = SimonResult.all.to_a.map{ |result| [result.value, result.n_num, result.n_fact] }

    expect(result).to eq([[2, 3, 6],
                          [3, 4, 24],
                          [5, 5, 120],
                          [9, 6, 720]])
  end
end
