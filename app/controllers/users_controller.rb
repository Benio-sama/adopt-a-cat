class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      flash[:notice] = "Sikeres regisztráció!"
      redirect_to hello_path
    else
      flash[:notice] = "Hiba történt a regisztráció során!"
      flash[:error] = @user.errors.full_messages
      redirect_back fallback_location: registration_path
    end
  end

  def edit
    @user = @session_user || User.first
  end

  def update
    @user = @session_user || User.first
    if @user.update(user_params)
      flash[:notice] = "Profil sikeresen módosítva!"
      redirect_to profile_path
    else
      flash[:notice] = "Hiba történt a profil módosítása során!"
      flash[:error] = @user.errors.full_messages
      redirect_back fallback_location: profile_path
    end
  end

  def forgotten
    @user = User.new
  end

  def recover
    flash[:notice] = "Jelszó-helyreállító levél kiküldve (szimuláció)."
    redirect_to hello_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end