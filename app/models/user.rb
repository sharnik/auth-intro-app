class User < ActiveRecord::Base

  def authenticate(submitted_password)
    submitted_password == password
  end
end
