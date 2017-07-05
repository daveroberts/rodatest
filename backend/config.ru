require "./app/app.rb"
if ENV["RACK_ENV"]=='development'
  require 'pry'
end

::ROOT = File.dirname( File.expand_path( __FILE__ ) )
use Rack::Static, urls: { "/"=> "index.html" }, root: "static"

run Rack::URLMap.new({
  "/"=> Rack::Directory.new("static"),
  "/api"=> App.new
})
