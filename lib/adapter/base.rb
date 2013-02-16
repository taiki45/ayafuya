# -*- coding: utf-8 -^-

class Adapter::Base
  def save(event)
    raise NotImplementedError
  end
end
