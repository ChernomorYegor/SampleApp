class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.paginate(page: params[:page], per_page: 20)
	end

  def show
  	@user = User.find(params[:id])
  	@microposts = @user.microposts.paginate(page: params[:page], per_page: 2)
  end

  def new
  	@user = User.new
  end

  def create
		@user = User.new(user_params)
		if @user.save
			@user.send_activation_email
			flash[:info] = "Please check your email to activate your account."
			redirect_to root_url
		else
		render 'new'
		end
	end

	def edit
		# @user = User.find(params[:id])
	end

	def update
		# @user = User.find(params[:id])
		if @user.update(user_params)
		flash[:success] = "User updated!"
		redirect_to edit_user_url(@user)
		else
		render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:success] = "User killed!"
		else
			flash[:danger] = "Destroy failed"
		end
		redirect_to users_url
	end

	def following
		@following = current_user.following
	end

	def followers
		@followers = current_user.followers
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless @user == current_user
	end

end
