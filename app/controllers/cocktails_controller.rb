class CocktailsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def show
    @cocktail = Cocktail.find(params[:id])
  end
  
  def new
    @cocktail = Cocktail.new
  end
  
  def create
    @cocktail = current_user.cocktails.build(cocktail_params)
    if @cocktail.save
      flash[:success] = 'cocktailを投稿しました。'
      redirect_to root_url
    else
      @cocktails = current_user.cocktails.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'cocktailの投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @cocktail = Cocktail.find(params[:id])
  end
  
  def update
    @cocktail = Cocktail.find(params[:id])

    if @cocktail.update(cocktail_params)
      flash[:success] = 'Cocktail は正常に更新されました'
      redirect_to @cocktail
    else
      flash.now[:danger] = 'Cocktail は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    flash[:success] = 'cocktailを削除しました。'
    redirect_to root_path
  end
  
  private
  
  def cocktail_params
    params.require(:cocktail).permit(:name, :content, :ingredient, :recipe)
  end
  
  def correct_user
    @cocktail = current_user.cocktails.find_by(id: params[:id])
    unless @cocktail
      redirect_to root_url
    end
  end
end
