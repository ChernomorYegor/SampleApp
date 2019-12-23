class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  end

	def email
		@user = User.find(params[:id])
  end

  def help
  end
end
