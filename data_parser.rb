require 'nokogiri'
require 'time'

class ParseDataError < RuntimeError; end

class DataParser
  def initialize(data)
    @doc = Nokogiri::HTML(data)
    @parsed_data = nil
    fetch_values
  end

  def fetch_values
    result = []

    @doc.search('table tbody tr td p').map do |node|
      result << node.text
    end

    parse(result)
  end

  def generate
    result = {}
    template.map do |k, v|
      result[k] = @parsed_data.pop.to_i
    end

    result
  end

  private

  def parse(data)
    @parsed_data = data.map { |value| value.scan(/\w+/) }.flatten
  end

  def template
    {
      excluded_cases: nil,
      total_cases: nil,
      total_deaths: nil,
      total_recovery: nil,
      year: nil,
      month: nil,
      day: nil,
      hour: nil
    }
  end
end
