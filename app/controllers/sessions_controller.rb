class SessionsController < ApplicationController

  def new
  end

  def create
    if (user = User.find_by_login session_params[:login]) &&
        user.authenticate(session_params[:password])
      render text: "Signed in!"
    else
      render text: "Wrong login/password. Naughty, naughty."
    end
  end

  private

  def session_params
    params.permit(:login, :password)
  end
end