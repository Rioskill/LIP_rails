# frozen_string_literal: true

# ActiveRecord for interval
class SimonInterval < ApplicationRecord
  has_and_belongs_to_many :simon_results

  validates :start, presence: true, uniqueness: { scope: :end }
  validates :end, presence: true

  def to_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.interval do
        xml.start start
        xml.end self.end
        xml.results do
          simon_results.all.each do |result|
            xml.value result.value
            xml.n_num result.n_num
            xml.n_fact result.n_fact
          end
        end
      end
    end.doc.root.to_xml
  end

  def self.xml_dump
    Nokogiri::XML::Builder.new do |xml|
      xml.intervals do
        all.each do |interval|
          xml.parent << interval.to_xml
        end
      end
    end.to_xml
  end
end
