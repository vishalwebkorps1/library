class Books::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :update,  :destroy]

  # GET /books
  def index
    @books = Book.all
    Bookmaker::BookCreator.call(@book)
    information(@books)
  end

  # get /books/1
  def show
    Bookmaker::BookCreator.call(@book)
    information([@book])
  end

  # Post /books
  def create
    
    @book = Book.new(books_params)
    Bookmaker::BookCreator.call(@book)
    if @book.save
      render json:{message: 'Book was created successfully', book: @book},status: :created
    else
      render json: {error: "coudn't create #{@book.errors.full_messages}"}
    end
  end
  
  
  # PUT /books/
  def update
    if @book.update(books_params)
      Bookmaker::BookCreator.call(@book)
      render json: {message:"Book was successfully updated", book: books_params}
    else
      handle_error @book.errors
    end
  end

  # DELETE /books/:id
  def destroy
    if @book.destroy
      Bookmaker::BookCreator.call(@book)
      render json: {message:"Book was successfully destroyed"}
    else
      render json: { error: @book.errors.full_messages}, status: :unprocessable_entity
    end
  end
 
  private

  
  def set_book
    @book = Book.find_by(params[:id])
    #  render json: { error: "unable to find book "}, status: :unprocessable_entity 
  end

  def books_params
    params.require(:book).permit(:name, :author, :description, :user_id, :edition, :quantity)
  end
end


















