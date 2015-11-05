require 'pry'
require 'capybara'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'active_support/all'

#so we can require in the world Domain::Model
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

#getting the absolute path to a file when you know the path relative to the current file
expanded_current_file_path = File.expand_path(File.dirname(__FILE__))

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.javascript_driver = config.default_driver
  config.default_selector = :css  
  config.ignore_hidden_elements = true
  config.default_max_wait_time = 10
  config.app_host = Model::Config['site_url']
end 

set_browser = ENV['BROWSER'] || 'chrome'

#mabye put this in its own capybara class/module
case set_browser.to_sym
  when :firefox
    Capybara.register_driver :selenium do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      Capybara::Selenium::Driver.new(app, :profile => profile)
    end

  when :chrome
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome, :switches => %w[--ignore-certificate-errors --test-type])
    end
end
  
World(Capybara::DSL)