ENV['RACK_ENV'] = 'test'
require 'rspec'
require 'capybara/rspec'
require_relative '../rss'

set :views => File.join(File.dirname(__FILE__), "..", "views")

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.app = Sinatra::Application.new
