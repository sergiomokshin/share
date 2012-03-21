class LinksController < ApplicationController
  before_filter :check_sign_in
 
  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])
    
    @link.user_id = current_user_id

    respond_to do |format|
      if @link.save
        @post = Post.find(@link.post_id);
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render json: @link, status: :created, location: @link }
        format.js {}
      else
        format.html { render action: "new" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js { head :ok }
    end
  end
end
