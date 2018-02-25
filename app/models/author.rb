class Author < ApplicationRecord

  has_many :relations
  has_many :books, through: :relations
  validates :name, presence: true
  validates :name, uniqueness: true

end
