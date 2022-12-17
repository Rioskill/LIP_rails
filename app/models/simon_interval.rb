class SimonInterval < ApplicationRecord
  has_and_belongs_to_many :simon_results

  validates :start, presence: true
  validates :end, presence: true
end
