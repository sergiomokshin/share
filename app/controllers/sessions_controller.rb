class SessionsController < ApplicationController	

	def create
	  auth = request.env["omniauth.auth"]	  
	  user = User.login(auth)

	  puts "----------------USUARIO--------------"
	  puts user.inspect
	  session[:user_id] = user.id
	  
	  #session[:user_id] = 2
	  
	  redirect_to posts_path, :notice => "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_url
		#redirect_to users_path, :notice => "Signed out!"
	end

end
