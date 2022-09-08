class Books::BooksController < ApplicationController

    before_action :authenticate_user!



    def index
        @books = Book.all
        render json: @books, status: :ok

    end



    def show
        @books = Book.find(params[:id])
        render json: @books, status: :ok
    end



    def create
       @book = Book.new(books_params)
   
       
       if @book.save
        render json:{message: 'success'}
       else
        render json: {error: "coudn't create #{@book.errors.full_messages}"},status: :unprocessable_entity
       end
    end


    def update
        @book = Book.find(params[:id])
        if @book.update(books_params)
            render json: {message:"Book was successfully updated"}
        else
            render json: { error: @book.errors.full_messages}, status: :unprocessable_entity
        end

           
    end


    def destroy
        @book = Book.find(params[:id])
        if @book.destroy
            render json: {message:"Book was successfully destroyed"}
        else
            render json: { error: @book.errors.full_messages}, status: :unprocessable_entity
        end


    end


    private

    def set_book
        @book = Book.find(params[:id])
    end



    def books_params
      
        params.require(:book).permit(:name, :author, :description, :user_id, :edition, :quantity)
    end
           













end


















