$: << "."
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), ".."))
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'cucumber/rb_support/regexp_argument_matcher'
require 'rspec'
require 'rspec/matchers'
require 'capybara/selector'
require 'capybara/dsl'
require 'capybara/helpers'
require 'capybara/rspec'
require 'capybara/node/finders'
require 'site_prism'
require 'capybara/selenium/driver'
require 'yaml'
require 'site_prism/element_checker'


Capybara.default_driver = :selenium

$base_url ="http://customer.test.ccycloud.com"


After do |scenario|
  sleep(1.to_i)
  if scenario.failed?
    current_path = File.expand_path File.dirname(__FILE__)
    screenshot = "#{current_path}#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    page.save_screenshot(screenshot)
  end
end


module Helpers
  #placeholder module for all helper functions and classes
end




World(Helpers)