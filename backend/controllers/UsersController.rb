require "roda"

class UsersController < Roda
  route do |r|
    r.is do
      "list of users!"
    end
  end
end
