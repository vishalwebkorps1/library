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
       @books = Book.new(books_params)
       if @books.save
        render json: @books, status: :created
       else
        render json: {error: "coudn't create"},status: :unprocessable_entity
       end
    end


    def update
        @books = Book.find(params[:id])
        if @books.update(books_params)
            render json: {message:"Book was successfully updated"}
        else
            render json: { error: @books.errors.full_messages}, status: :unprocessable_entity
        end

           
    end


    def destroy
        @books = Book.find(params[:id])
        if @books.destroy
            render json: {message:"Book was successfully destroyed"}
        else
            render json: { error: @books.errors.full_messages}, status: :unprocessable_entity
        end


    end


    private

    def set_book
        @book = Book.find(params[:id])
    end



    def books_params
      
        params.permit(:name, :author, :description, :user_id, :edition, :quantity)
    end
           













end
