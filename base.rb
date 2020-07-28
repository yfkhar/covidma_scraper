require 'faraday'

module API
  class Base
    def initialize(url, headers = {}, params = {})
      @conn = Faraday.new(
        url: url,
        params: params,
        headers: headers
      )
    end

    def request(type)
      @response = @conn.send(type)
    end

    def response
      return nil unless @response.success?

      @response.body
    end
  end
end
