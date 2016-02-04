class PostsController < ApplicationController
	before_action :find_post, only: [:show,:edit,:update,:destroy]
	def index
		
	end
	def new
	@post = Post.new
	end
	def create

	@post =	Post.new post_params

	if @post.save

		redirect_to @post, notice: "Yeahh, Estamos Ready"
	else
		render 'new', notice: "oooohhhooo, NO estamos Ready"
  end
 end
	 def show

	 	@post = Post.find(params[:id])
	 	
	 end
	 def update
	 	if @post.update post_params
	 		redirect_to @post, notice: "Post Updated"
	 		
	 		else
	 			render "edit"
	 	end
	 end
	 def edit
	 	
	 end
	 def destroy
	 	@post.destroy
	 	redirect_to posts_path
	 end
	private
		def find_post
			@post = Post.find(params[:id])
			
		end
		def post_params

		params.require(:post).permit(:title, :content)
	end
end
