ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class CarrierWave::Mount::Mounter
  def store!
    # Not storing uploads in the tests
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include ActionDispatch::TestProcess
  fixtures :all
  
  CarrierWave.root = Rails.root.join('test/fixtures/files')

  # Add more helper methods to be used by all tests here...
  def after_teardown
    super
    CarrierWave.clean_cached_files!(0)
  end
end
