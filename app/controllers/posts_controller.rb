class PostsController < ApplicationController
 before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all.reverse
    @post = Post.new
    @comment = Comment.new
    
  end

  def show
  	@comment = Comment.new
  end

  def new
  	@post = Post.new

  end

  def create

  	@post = Post.new(post_params)

  	if @post.save
  		flash[:notice] = "Your post was created."
  		redirect_to posts_path
  	else
  		render 'new'
  	end

  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		flash[:notice] = "The post was updated"
  		redirect_to posts_path
  	else
  		render :edit
  	end

  end

   def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def post_params
  	params.require(:post).permit!
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
