module PostHelper
  def by_context_post_path(post)
    posts_path( context_id: post.id )
  end
end
