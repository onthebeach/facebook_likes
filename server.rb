require 'rack'
require_relative 'facebook_likes'

Rack::Handler::Thin.run FacebookLikes.new, :Port => 9292
