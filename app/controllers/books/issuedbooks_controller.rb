class Books::IssuedbooksController < ApplicationController
    load_and_authorize_resource 

  def index 
    if current_user.role.name == 'admin'
      @books = Issuedbook.all
      render json: @books, status: :ok unless @books.blank?
      if @books.blank?
        render json: {message: "no issued Books"}
      end
    else
      @books = current_user.issuedbooks.all
      render json: @books
      # no_book
    end
  end

  def issue
    #authorize! :issue , Book
    @book = Book.find_by(name: params[:name])
    @issue = Issuedbook.find_by(book_id: @book.id, user_id: params[:user_id].to_i)
    if !@issue.blank? && @book.id == @issue.book_id
      render json: {message: "Book Already issued"}
    else
      @issue = Issuedbook.new(book_id: @book.id, user_id: params[:user_id].to_i)
      if @issue.save
        @book.update(quantity: (@book.quantity.to_i - 1).to_s)
        render json: {message: "issue successfully"}
      else
        render json: {errors: @issue.errors.full_messages}
      end
    end
  end

  def return
    #authorize! :return , IssuedBook
    @user = Issuedbook.find_by(user_id: params[:user_id])
    if @user.destroy
      @book = Book.find_by(id: @user.book_id)
      @book.update(quantity: (@book.quantity.to_i + 1).to_s)
      render json: {message: "Book returned successfully"}
    else
      render json: {message: "Book not returned"}
    end
  end
end

































