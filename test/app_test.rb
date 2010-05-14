require 'test_helper'

class AppTest < Test::Unit::TestCase

  context 'App' do

    context 'getting the index' do
      setup do
        get '/'
      end

      should 'have layout' do
        assert_match /<title>app<\/title>/, body
      end

      should 'render index' do
        assert_match /<h1>Hello from Sinatra .*<\/h1>/, body
      end

      should 'respond with success' do
        assert_equal 200, status
      end
    end

    context 'getting the stylesheet' do
      setup do
        get '/stylesheets/styles.css'
      end

      should 'respond with success' do
        assert_equal 200, status
      end

      should 'have styles from compass' do
        assert_match /margin: 0/, body
      end
    end

  end

end
