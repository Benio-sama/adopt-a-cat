class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    redirect_to '/home', notice: 'sikeres regisztracio'
  end

  def edit
    @user = User.new(id: 1, name: "test", email: "test@test.hu")
  end

  def update
    redirect_to '/home', notice: "sikeres frissites"
  end

  def forgotten
    @user = User.new
  end
end
