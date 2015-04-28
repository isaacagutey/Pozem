class RepliesController < ApplicationController
def create
		@comment = Comment.find(params[:comment_id])

		@reply = Comment.new(params.require(:reply).permit(:body))

		if @reply.save
			flash[:notice] = "Your comment was added"
			redirect_to post_path(@post)
		else
			render 'posts/show'
		end
	end
end