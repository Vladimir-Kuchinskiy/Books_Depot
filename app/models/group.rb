class Group < ApplicationRecord

  has_many :groupings
  has_many :books, through: :groupings

  validates :name, presence: true
  validates :name, uniqueness: true

  def add_book(id)
    @book = Book.find(id)
    self.books << @book
  end

end
