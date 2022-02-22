module Request
  module JsonHelpers
    def json_body
      JSON.parse(response.body).deep_symbolize_keys
    end
  end
end
