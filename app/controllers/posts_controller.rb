class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		# @post = Post.new # you need a Model to use Post.new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.save
		redirect_to @post
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to root_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end
