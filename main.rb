require_relative 'base'
require_relative 'data_parser'
require_relative 'statistic'
require_relative 'report'

uri = "http://www.covidmaroc.ma/pages/accueilar.aspx".freeze
user_agent = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (K HTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36" }

node = API::Base.new(uri, user_agent)

node.request(:get)

brut_data = node.response

parser = DataParser.new(brut_data)
data = parser.generate

p data

report = Report.new(data)
