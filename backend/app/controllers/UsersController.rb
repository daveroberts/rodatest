require "roda"

class UsersController < Roda
  plugin :json
  route do |r|
    response['Content-Type'] = 'application/json; charset=utf-8'
    r.is do
      ["Разходка в Докторската градина и наоколо", "list of users! Changed"]
    end
  end
end
