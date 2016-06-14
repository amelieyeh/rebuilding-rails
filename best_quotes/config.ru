require './config/application'
# require './config/bobo'
# require './config/const_missing'
run BestQuotes::Application.new

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

class Canadianize
  def initialize(app, arg = "")
    @app = app
    @arg = arg
  end

  def call(env)
    status, headers, content = @app.call(env)
    content[0] += @arg + ", eh?"
    [status, headers, content]
  end
end

use Canadianize, ", simple"

run proc {
  [200, {"Content-Type" => 'text/html'},
   ["Hello, world!"]]
}

