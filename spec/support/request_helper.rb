# frozen_string_literal: true

module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def json_error
      json['error']
    end
  end
end
