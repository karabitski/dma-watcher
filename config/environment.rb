require 'irb'
require 'rubygems'
# require 'virtus'
require 'sugarcrm'
require 'awesome_print'
require 'active_record'
require 'mechanize'
require 'ancestry'

Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each do |file|
  require file
end

config = YAML.load(File.open File.dirname(__FILE__) + '/database.yml')
ActiveRecord::Base.establish_connection config['development']

