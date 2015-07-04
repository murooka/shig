require 'rack'

module Shig
  class Web
    class Request < Rack::Request

      def initialize(env)
        super(env)
      end

    end
  end
end
