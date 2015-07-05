class PostsController < ApplicationController

  include PostHelper

  # Thread Detail view
  def index
    @posts = Post.by_context( params[:context_id] )
    @post = @posts.first
  end

  # Homepage
  def top
    @posts = Post.top
  end

  def create
    @post = Post.new( params[:post] )
    if @post.save
      flash[:notice] = "Post created :)"
      redirect_to by_context_post_path(@post)
    else
      flash[:alert] = "Couldn't create post!"
      redirect_to :back
    end
  end

  def new
    @post = Post.new
  end
end
