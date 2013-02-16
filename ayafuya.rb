# -*- coding: utf-8 -*-
require 'yaml'
require 'pry'

full = -> path { File.expand_path "../#{path}", __FILE__ }
$LOAD_PATH.unshift(full.('lib'))
require 'adapter'


Plugin.create :ayafuya do
  config_path = File.exists?(full.('config.yaml')) ? 'config.yaml' : 'sample.yaml'
  config = YAML.load(open(full.(config_path)))
  db_config = config['database']

  database = case db_config['type']
             when 'redis'
               Adapter::Redis.new host: db_config['host'], port: db_config['port']
             end

  on_update do |service, events|
    events.each do |event|
      database.save event
    end
  end
end
