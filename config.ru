#\ -p 8585
#
require 'app'

use Rack::Reloader, 1

run App.new

puts "loading server..."
puts "(localhost:8585)"
