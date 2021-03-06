class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:edit, :update]

	def index
		@books = Book.all
    	@book = Book.new
		@users = User.all
		@user = current_user
	end

	def show
		@users = User.all
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	 	@user = User.find(params[:id])
		if @user.update(user_params)
    	   redirect_to user_path(@user), notice: "successfully updated user!"
    	else
    		render 'edit'
    	end
	end

	def follows

	end

	def followers

	end

	private
  	# ストロングパラメータ
  	def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  	end

  	def ensure_correct_user
		@user = User.find(params[:id])
		unless @user == current_user
    		redirect_to user_path(current_user)
    	end
	end
end
