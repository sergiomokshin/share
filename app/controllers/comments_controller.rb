class CommentsController < ApplicationController
  before_filter :check_sign_in
 
  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user_id

    respond_to do |format|
      if @comment.save
        @post = Post.find(@comment.post_id);
        format.xml { render :xml => @comment, :status => :created, :location => @comment }
        format.js {}
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js { head :ok }
    end
  end
end
