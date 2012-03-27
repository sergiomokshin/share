class PostUsersController < ApplicationController

  before_filter :check_sign_in
 
  # POST /links
  # POST /links.json
  def create
       
  @user = User.find(params[:post][:user_id])
  @post = Post.find(params[:posts_user][:post_id])
  
  @post.users << @user
     
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'User was successfully associated.' }
        #format.xml { render :xml => @post_user, :status => :created, :location => @post_user }
        #format.js {}
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy

     parametros = params[:id].split("_")
     user_id = parametros[0].to_i
     post_id = parametros[1].to_i

     post = Post.find(post_id) 
     user = post.users.find(user_id)

     if user
        post.users.delete(user)
     end 

    # @comment = Comment.find(params[:id])
     #@comment.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js { head :ok }
    end
    
  end


end