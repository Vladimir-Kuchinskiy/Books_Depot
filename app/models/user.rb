class User < ApplicationRecord

  has_secure_password

  validates :login, :password, presence: true, on: :create
  validates :login, uniqueness: true

  def admin?
    self.role == 'admin'
  end

  def special_ability?
    self.special_ability == true
  end

end
