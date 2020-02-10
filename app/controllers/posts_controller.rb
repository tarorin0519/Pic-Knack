class PostsController < ApplicationController

	def new
	  @post = Post.new
	end

	def create
	  @post = Post.new(post_params)
	  if @post.save
	  	redirect_to_post_path(@post)
	  else
	  	rendr :new
	  end
	end

	def show
	  @post = Post.find(params[:id])
	  @post_comment = Post.Comment.new
	end

	def edit
	  @post = post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])
	  if @params.update(post_params)
	  rediret_to post_path(@post)
	  else
	  	render action :edit
	  end

	def destroy
		@post = PostImage.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	  end
	end

	private
	  def post_params
	  	params.require(:post).permit(:title, :body, :genre, :image, :user)
	  end


end
