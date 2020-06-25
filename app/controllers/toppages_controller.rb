class ToppagesController < ApplicationController
  def index
    if logged_in?
      @cocktail = current_user.cocktails.build  # form_with 用
      @cocktails = Cocktail.order("RANDOM()").limit(5)  #mySQLでは"RAND()"、本番は"RANDOM()"
    end
  end
end
