require 'net/http'
require 'json'

class LikeFinder

  def likes
    parsed_response.fetch("likes")
  end

  private

  def uri
    URI("http://graph.facebook.com/onthebeachholidays")
  end

  def port
    80
  end

  def request
    Net::HTTP::Get.new(uri.request_uri).tap do |request|
      request['Content-Type'] = 'application/json'
    end
  end

  def parsed_response
    JSON.parse(response.body)
  end

  def response
    @response ||= http.request(request)
  end

  def http
    Net::HTTP.new(uri.host, port).tap do |http|
      http.open_timeout = 30
      http.read_timeout = 60
    end
  end

end
