class Client < ApplicationRecord

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :email, uniqueness: true

  has_many :client_has_books, dependent: :destroy
  has_many :books, through: :client_has_books

end
