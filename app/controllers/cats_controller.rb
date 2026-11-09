class CatsController < ApplicationController
  def index
    @cats = Cat.all
    if params[:tag].present? && params[:tag] != "All"
      @cats = @cats.select { |cat| cat.tags.to_a.include?(params[:tag]) }
    end
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def adopt
    if @session_user.present?
      @cat = Cat.find(params[:id])
      @cat.update(user: @session_user)
      flash[:notice] = "#{@cat.name} sikeresen lefoglalva!"
      redirect_to profile_path
    else
      flash[:error] = "Kérlek jelentkezz be az örökbefogadáshoz!"
      redirect_to login_page_path
    end
  end
end