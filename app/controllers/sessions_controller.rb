class SessionsController < ApplicationController	

	def create
	  	auth = request.env["omniauth.auth"]	  

  		@user = User.find(:all, :conditions => { :provider => auth["provider"], :uid => auth["uid"]}).first

	    if not @user
	      @user = User.new
	      @user.provider = auth["provider"]
	      @user.uid = auth["uid"]	     
	      @user.name = auth["info"]["name"]
	      @user.email = auth["info"]["email"]
	      @user.image = auth["info"]["image"]
	      @user.save 
	    end

	    puts auth

	  	session[:user_id] = @user.id	 
	  
	  	redirect_to posts_path, :notice => "Signed in!"
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_url
	end

end
