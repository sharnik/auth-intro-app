class SessionsController < ApplicationController

  def new
  end

  def create
    if (user = User.find_by_login session_params[:login]) &&
        user.authenticate(session_params[:password])
      set_current_user user
      redirect_to products_path
    else
      render text: "Wrong login/password. Naughty, naughty."
    end
  end

  def destroy
    clear_current_user
    render text: "Signed out."
  end

  private

  def session_params
    params.permit(:login, :password)
  end
end
