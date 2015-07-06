class SessionsController < ApplicationController

	def index
	end

	def new
		@store = Store.new
	end

	def create
		@store = Store.confirm(params.require(:store).permit(:email, :name, :password, :password_confirmation))
		if @store 
			login(@store)
			flash[:success] = "Successfully logged in"
			redirect_to account_path
		else
			flash[:error] = "Invalid email or password"
			redirect_to login_path
		end
	end

end
