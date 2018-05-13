class BooksCatalogController < ApplicationController

  def index
    @groups = Group.all
    @limit = 5
    offset = params[:offset].to_i * @limit ||= 0
    # offset equals the page we're in, so if we're in the first page
    # offset = 0 * limit, in this case 5, fetching only the first 5 items.
    # Second page, offset = 1 * limit, fetching 5 items after the first 5, etc.
    @books = Book.all.offset(offset).limit(@limit)
  end

end
