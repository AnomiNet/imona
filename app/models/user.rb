class User
  include Her::Model

  attributes :handle, :token
  validates :handle, presence: true
end
