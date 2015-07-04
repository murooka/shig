require 'shig'
require 'shig/web/request'
require 'shig/web/response'

module Shig
  class Web

    attr_reader :req
    alias request req

    def initialize(params)
      @req = self.create_request(params[:env])
    end

    def create_request(env)
      Request.new(env)
    end

    def create_response(status, headers, body)
      Response.new(body, status, headers)
    end

    def create_view
      raise 'Shig::Web#create_view should be overridden'
    end

    def dispatch
      raise 'Shig::Web#dispatch should be overridden'
    end

    def render(tmpl, params)
      html = self.class.create_view.render(tmpl, params)
      self.class.create_response(
        200,
        [
          'Content-Type'   => 'text/html; charset=UTF-8',
          'Content-Length' => html.length,
        ],
        html
      )
    end

  end
end
