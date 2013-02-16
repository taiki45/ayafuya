# -*- coding: utf-8 -^-

module Adapter
  class Base
    def save(event)
      raise NotImplementedError
    end
  end
end
