class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @cocktail = Cocktail.new
    @cocktails = Cocktail.first(3)
  end
end
