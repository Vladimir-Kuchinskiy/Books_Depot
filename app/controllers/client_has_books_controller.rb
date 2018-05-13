class ClientHasBooksController < ApplicationController

  before_action :set_client_book, only: [:create]
  before_action :require_admin, only: [:index, :create, :destroy]

  def index
    @client_has_books = ClientHasBook.all
  end

  def create
    ClientHasBook.create(client_id: @client.id, book_id: @book.id)
    @book.client_added
    redirect_to book_path(@book)
  end

  def destroy
    @client_has_book = ClientHasBook.find(params[:id])
    book = @client_has_book.book
    book.client_destroyed
    @client_has_book.destroy
    respond_to do |format|
      format.html { redirect_to client_has_books_path, notice: 'Record was successfully deleted.' }
      format.js
    end
  end

  private

  def set_client_book
    @client = Client.find(params[:client_id])
    @book   = Book.find(params[:book_id])
  end

end
