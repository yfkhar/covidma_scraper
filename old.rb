require 'httparty'
require 'nokogiri'

percentage_calculator = ->(a, b, round = 2) do
  ((a.to_f / b.to_f) * 100).round(round)
end

total_by_1m_pop = ->(total_cases, population) do
  average = population / 1_000_000
  
  total_cases.to_i / average
end

POPULATION = 36_927_069

class CovidScraper
  URI = "http://www.covidmaroc.ma/Pages/AccueilAR.aspx".freeze
  USER_AGENT = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (K HTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" }
  
  def self.fetch
    @response = Nokogiri::HTML(HTTParty.get(URI, headers: USER_AGENT))
    result = []

    @response.search('table tbody tr td p').map do |node|
      result << node.text
    end

    @data = result.map { |value| value.scan(/\w+/) }.flatten
  end
end
