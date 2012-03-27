class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :current_user, :current_user_id

	def check_sign_in
		if not user_signed_in?
			redirect_to login_url
		end	
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def current_user_id
		session[:user_id]
	end

	def user_signed_in?
		return true if current_user
	end

	#http://stackoverflow.com/questions/8965877/redirect-loop-with-rails-omniauth-on-before-filter

end
