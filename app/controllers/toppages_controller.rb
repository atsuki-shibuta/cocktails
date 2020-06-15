class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cocktail = current_user.cocktails.build  # form_with 用
      @cocktails = current_user.cocktails.order(id: :desc).page(params[:page])
    end
  end
end
