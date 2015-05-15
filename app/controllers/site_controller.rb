class SiteController < ApplicationController


  def Index

  	@user = current_user
  end

  def about
  	render 'about'
  end

end
