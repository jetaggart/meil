require 'active_record'
require 'yaml'
require 'sqlite3'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
