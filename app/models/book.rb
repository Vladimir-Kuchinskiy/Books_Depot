class Book < ApplicationRecord

  after_initialize :set_default_for_reading_now

  validates :title, :image_url, :count, presence: true
  validates :title, uniqueness: true

  has_many :groupings
  has_many :groups, through: :groupings

  has_many :client_has_books, dependent: :destroy
  has_many :clients, through: :client_has_books

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

  def clients_can_read
    Client.all - clients
  end

  def client_added
    update(count: self.count - 1, reading_now: self.reading_now + 1)
  end

  def client_destroyed
    update(count: self.count + 1, reading_now: self.reading_now - 1)
  end

  private

  def set_default_for_reading_now
    self.reading_now ||= 0
  end

end
