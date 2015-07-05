class Post
  include Her::Model

  has_one :user

  # Thread detail; what you see when you click on a Post.
  scope :by_context, ->(post_id) { where( context_id: post_id ) }

  # Home page "Top Posts" listing.
  scope :top, -> { where( scope: 'top' ) }

  def user
    User.new(
      handle: user_handle,
      id: user_id
    )
  end
end
