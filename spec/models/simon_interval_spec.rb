require 'rails_helper'

RSpec.describe SimonInterval, type: :model do
  it 'should create database record' do
    SimonInterval.create(start: 1, end: 10)

    found = SimonInterval.find_by(start: 1, end: 10)

    expect(found).not_to be_nil
    expect(found.start).to eq(1)
    expect(found.end).to eq(10)
  end

  it 'should not create duplicates' do
    SimonInterval.create(start: 1, end: 10)

    record = SimonInterval.create(start: 1, end: 10)

    expect(record).not_to be_valid
  end
end