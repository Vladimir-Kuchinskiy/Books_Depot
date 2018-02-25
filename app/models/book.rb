class Book < ApplicationRecord

  validates :title, :image_url, presence: true
  validates :title, uniqueness: true

  has_many :groupings
  has_many :groups, through: :groupings

  has_many :relations
  has_many :authors, through: :relations

  def author_list
    self.authors.collect do |author|
      author.name
    end.join(", ")
  end

  def author_list=(authors_string)
    author_names = authors_string.split(",").collect{ |s| s.strip }.uniq
    new_or_found_authors = author_names.collect { |name| Author.find_or_create_by( name: name ) }
    self.authors = new_or_found_authors
  end

  def add_author(id)
    @author = Author.find(id)
    self.authors << @author
  end

end
