class CommentsController < ApplicationController
	before_action :set_post
    
	def create
        
		@comment = @post.comments.build(params.require(:comment).permit(:body))
		@comment.creator = User.first

        respond_to do |format|
		if @comment.save
	       format.html {redirect_to post_path(@post)}
	       format.js      
		else
			flash[:notice] = 'Your comment was not added'
			render 'posts/show'
		end
		end
	end

	def set_post
		@post = Post.find(params[:post_id])
	end
end