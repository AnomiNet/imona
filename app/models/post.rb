class Post
  include Her::Model

  attributes :body, :direct_child_ids, :created_at, :current_user_vote, :depth, :id, :parent_id, :root_id, :score, :tldr, :url, :user_handle, :user_id

  has_one :user
  has_many :posts

  # Thread detail; what you see when you click on a Post.
  scope :by_context, ->(id) { get( "/posts/#{id}/context" ) }

  # Home page "Top Posts" listing.
  scope :top, -> { where( scope: 'top' ) }

  def user
    User.new(
      handle: user_handle,
      id: user_id
    )
  end
end
