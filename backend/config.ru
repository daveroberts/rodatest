require "./app.rb"

puts ENV["RACK_ENV"]

::ROOT = File.dirname( File.expand_path( __FILE__ ) )
use Rack::Static, urls: { "/"=> "index.html" }, root: "static"

run Rack::URLMap.new({
  "/"=> Rack::Directory.new("static"),
  "/api"=> App.freeze.app
})
