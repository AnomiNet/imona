class PostsController < ApplicationController

  # Thread Detail view
  def index
    @posts = Post.by_context( params[:context_id] )
    @post = @posts.first
  end

  # Homepage
  def top
    @posts = Post.top
  end
end
