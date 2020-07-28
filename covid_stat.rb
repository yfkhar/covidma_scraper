class CovidStat
  def self.generate(data = [])
    return "no data to parse" if data.empty?
  
    {
      scrap_time: Time.now,
      excluded_cases: data.pop,
      total_cases: data.pop,
      total_deaths: data.pop,
      total_recovery: data.pop,
      reported_at: Time.parse("#{data.pop(3).join("-")} #{data.pop(data.length).join}")
    }
  end
end

# statistics = {
#   stats: {
#     'active_cases' => covid_data.fetch("total_cases").to_i - covid_data.fetch("total_recouvred").to_i,
#     'fatality_rate' => percentage_calculator.call(covid_data.fetch("total_deaths"), covid_data.fetch("total_cases")),
#     'infection_rate' => percentage_calculator.call(covid_data.fetch("total_cases"), POPULATION, 3),
#     'total_test' => covid_data.fetch("total_cases").to_i + covid_data.fetch("excluded_cases").to_i,
#     'total_cases_by_1m_pop' => total_by_1m_pop.call(covid_data.fetch("total_cases"), POPULATION),
#     'total_deaths_by_1m_pop' => total_by_1m_pop.call(covid_data.fetch("total_deaths"), POPULATION)
#   }
# }
