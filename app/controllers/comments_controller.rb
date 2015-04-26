class CommentsController < ApplicationController
	before_action :set_post

	def create
        @post = Post.find(params[:post_id])
        # @comment = Comment.new(params.require(:comment).permit(:body))
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.creator = User.first

		if @comment.save
	      flash[:notice] = 'Your comment was added'
	      redirect_to post_path(@post)
		else
			flash[:notice] = 'Your comment was not added'
			render 'posts/show'
		end
	end

	def set_post
	end
end