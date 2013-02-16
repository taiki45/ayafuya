# -*- coding: utf-8 -*-
require 'json'
require 'redis'
require 'active_support/core_ext/hash'

module Adapter
  class Redis < Adapter::Base
    def initialize(*args)
      @redis = ::Redis.new args.last
    end

    attr_reader :redis

    def save(event)
      redis.zadd 'tweets', event.id, JSON.generate(event.to_hash.stringify_keys)
    end
  end
end
