class PostsController < ApplicationController

  include PostHelper

  # Thread Detail view
  def context
    @posts = Post.by_context( params[:id] )
    @post = @posts.shift
    # TODO: Build tree of posts
  end

  # Homepage
  def top
    @posts = Post.top
  end

  def create
    @post = Post.new( params[:post] )
    if @post.save
      flash[:notice] = "Post created :)"
      redirect_to context_post_path(@post)
    else
      flash[:alert] = "Couldn't create post!"
      redirect_to :back
    end
  end

  def new
    @post = Post.new
  end

  def new_reply
    @post_parent = Post.find( params[:id] )
    @post = Post.new( parent_id: params[:id] )
  end

  def create_reply
    @post_parent = Post.find( params[:id] )
    @post = Post.new( params[:post] )
    @post.parent_id = params[:id].to_i
    if @post.save
      flash[:notice] = "Post created :)"
      redirect_to context_post_path(@post)
    else
      flash[:alert] = "Couldn't create post!"
      redirect_to :back
    end
  end
end
