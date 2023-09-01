class CommentsController < ApplicationController
    def create
      @pic = Pic.find(params[:pic_id])
      @comment = @pic.comments.create(comment_params.merge(user: current_user))
      redirect_to @pic
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  