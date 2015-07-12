class PostsController < ApplicationController

  include PostHelper

  # Thread Detail view
  def context
    @posts = Post.by_context( params[:id] )
    @post = @posts.shift
    @post_parent = nil
    if @post.parent_id
      post_parent_index = @posts.find_index{ |p| p.id == @post.parent_id }
      if post_parent_index
        @post_parent = @posts.delete_at(post_parent_index)
      end
    end
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
      flash.now[:alert] = "Couldn't create post!"
      render :new
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
