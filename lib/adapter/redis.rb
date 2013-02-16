# -*- coding: utf-8 -*-
require 'redis'

class Adapter::Resid < Adapter::Base
  def initialize(*args)
    @redis = Redis.new args
  end

  def save
    nil
  end
end
