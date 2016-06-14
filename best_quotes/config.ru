require './config/application'
require 'rack/lobster'
# require './config/bobo'
# require './config/const_missing'
run BestQuotes::Application.new

use Rack::ContentType

map "/lobster" do
  use Rack::ShowExceptions
  run Rack::Lobster.new
end

map "/lobster/but_not" do
  run proc {
    [200, {}, ["Really not a lobster"]]
  }
end

run proc {
  [200, {}, ["Not a lobster"]]
}
# INNER_LAYER = proc {
#   "world!"
# }
# OUTER_LAYER = proc {
#   inner_content = INNER_LAYER.call
#   [200, {'Content-Type' => 'text/html'},
#    ["Hello~~~~~~," + inner_content]]
# }
# run OUTER_LAYER

# use Rack::Auth::Basic, "app" do |_, pass|
#   'secret' == pass
# end
#
# run proc {
#   [200, {'Content-Type' => 'text/html'},
#    ["Hello, world!"]]
# }

# class Canadianize
#   def initialize(app, arg = "")
#     @app = app
#     @arg = arg
#   end
#
#   def call(env)
#     status, headers, content = @app.call(env)
#     content[0] += @arg + ", eh?"
#     [status, headers, content]
#   end
# end

# use Canadianize, ", simple"
#
# run proc {
#   [200, {"Content-Type" => 'text/html'},
#    ["Hello, world!"]]
# }


