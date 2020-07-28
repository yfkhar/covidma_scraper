require 'json'

class Report

  def initialize(data, format = :json)
    @report = case format
              when :json
                JSON.pretty_generate(data)
              else
                "format error"
              end
    save unless @report.nil?
  end

  

  private

  def save
    File.open("covid_data.json", "w") do |f|
      f.write(@report)
      f.rewind
    end
  end
end
