class Post
  include Her::Model

  has_one :user

  scope :top, -> { where(scope: 'top') }

  def user
    User.new(
      handle: user_handle,
      id: user_id
    )
  end
end
