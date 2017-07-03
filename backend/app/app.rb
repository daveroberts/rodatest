require "roda"
require './app/controllers/UsersController.rb'

class App < Roda
  plugin :json
  route do |r|
    response['Content-Type'] = 'application/json; charset=utf-8'
    r.on "users" do
      r.run UsersController
    end
    r.on "hello" do
      ["Разходка в Докторската градина и наоколо", "Bonjour"]
    end
  end
end
