require "roda"
require './controllers/UsersController.rb'

class App < Roda
  route do |r|
    r.on "users" do
      r.run UsersController
    end
    r.on "hello" do
      "Hello world"
    end
  end
end
