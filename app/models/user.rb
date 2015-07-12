class User
  include ApiModel

  attributes :handle, :token
  validates :handle, presence: true
end
