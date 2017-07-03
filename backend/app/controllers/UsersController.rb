require "roda"
require 'json'

class UsersController < Roda
  users = [
    {id: 1, name: "Dave", age: 34},
    {id: 2, name: "Jen", age: 35}
  ]

  plugin :json
  route do |r|
    response['Content-Type'] = 'application/json; charset=utf-8'
    r.get do
      users
    end
    r.get Integer do |id|
      users.find{|u|u[:id]==id}
    end
    r.post do
      begin
        body = r.body.read
        json = JSON.parse(body)
      rescue JSON::ParserError => e
        puts e.class
      end
      json
    end
  end
end
