# -*- coding: utf-8 -*-
require 'yaml'
require 'pry'

full = -> path { File.expand_path "../#{path}", __FILE__ }
$LOAD_PATH.unshift(full 'lib')
require 'lib/adapter'


Plugin.create :ayafuya do
  config_path = File.exists?(full('config.yaml')) ? 'config.yaml' : 'sample.yaml'
  config = YAML.load(open(full(settings_path)))
  db_config = config['databese']
  databese = case db_config['type']
             when 'redis'
               Redis.new host: db_config['host'], port: db_config['port']
             end
end
