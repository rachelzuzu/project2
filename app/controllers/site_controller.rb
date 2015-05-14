class SiteController < ApplicationController

  def index
  	@user = current_user
  end

  def about
  	render 'about'
  end

end
