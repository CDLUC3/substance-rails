require 'rubygems'
require 'bundler/setup'
require 'action_view'
require 'active_support'
require 'active_model'
require 'abstract_controller'
require 'action_controller'

require 'substance-rails'

class ActiveSupport::TestCase
  include GlobalHelpers
  
end
