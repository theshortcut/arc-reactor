require 'test/unit'
require 'rack/test'
require 'contest'

require File.join(File.dirname(__FILE__), '..', 'app')

App.set({
  :environment => :test,
  :run => false,
  :raise_errors => true,
  :logging => false
})

module TestHelper

  def app
    App
  end

  def body
    last_response.body
  end

  def status
    last_response.status
  end

  include Rack::Test::Methods

end

Test::Unit::TestCase.send(:include, TestHelper)
