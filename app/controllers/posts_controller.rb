class PostsController < ApplicationController
  def top
    @posts = Post.top
  end
end
