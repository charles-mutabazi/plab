class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new # you need a Model to use Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to @post
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
