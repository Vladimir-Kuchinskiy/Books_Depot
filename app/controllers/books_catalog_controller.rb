class BooksCatalogController < ApplicationController

  def index
    @groups = Group.all
    @limit = 5
    offset = params[:offset].to_i * @limit ||= 0 # offset equals the page we're in, so if we're in the first page
    # offset = 0 * limit, in this case 10, fetching only the first 10 items.
    # Second page, offset = 1 * limit, fetching 10 items after the first 10, etc.
    @books = Book.all.offset(offset).limit(@limit)
  end

end
