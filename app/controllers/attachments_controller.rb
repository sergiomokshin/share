class AttachmentsController < ApplicationController
  before_filter :check_sign_in
 
  # POST /attachments
  # POST /attachments.json
  def create
    @attachment = Attachment.new(params[:attachment])

    @attachment.user_id = current_user_id
    respond_to do |format|
      if @attachment.save
        @post = Post.find(@attachment.post_id);
        format.html { redirect_to @post, notice: 'Attachment was successfully updated.' }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js { head :ok }
    end
  end
end
