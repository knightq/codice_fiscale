require 'rubygems'
require 'rspec'
require 'active_record'
require 'bundler'
require 'codice_fiscale'

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
load 'schema.rb'

I18n.load_path << File.dirname(__FILE__) + '/support/locale.yml'

RSpec.configure do |config|
  config.before do
    I18n.locale = :en
  end
end
