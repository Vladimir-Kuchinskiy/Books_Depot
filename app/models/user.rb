class User < ApplicationRecord

  has_secure_password

  validates :login, :password, presence: true, on: :create
  validates :login, uniqueness: true

  def admin?
    self.role == 'admin'
  end

end
