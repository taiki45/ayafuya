# -*- coding: utf-8 -*-
require 'json'
require 'redis'

module Adapter
  class Redis < Adapter::Base
    def initialize(*args)
      @redis = ::Redis.new args.last
    end

    attr_reader :redis

    def save(event)
      STDOUT.puts event.inspect
      redis.rpush 'tweets', Time.now.to_s
    end
  end
end
