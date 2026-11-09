class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user] = @user.id
      flash[:notice] = "Sikeres bejelentkezés!"
      redirect_to hello_path
    else
      flash[:notice] = "Érvénytelen email vagy jelszó!"
      redirect_back fallback_location: hello_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Sikeresen kijelentkeztél!"
    redirect_to hello_path
  end
end