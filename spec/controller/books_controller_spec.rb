require "rails_helper"
RSpec.describe Books::BooksController, type: :controller do

  describe "GET books#index" do
    let(:user){create(:user)}
    let(:book){create(:book)}


    context "when user is signed in" do
      before do
        sign_in(user)
      end

      it "It fetches all the records from book " do  
        get :index, format: :json
        data = JSON.parse(response.body)
        expect(data.count).to eq Book.all.count
      end
    end


    context "when user is signed in" do
      before do
        sign_in(user)
      end
      it "It fetches single record from the book" do
        get :show, params: {id: book.id}, format: :json
        data = JSON.parse(response.body)
        expect(response.status).to eq 200
      end
    end


    context "when user is signed in" do
      before do
        sign_in(user)
      end

      it "Book created successfully" do
        books_params = {book: {name:"parabhu", author:"indar", description:"this is for testing", user_id:"2", edition:"2", quantity:"3"}}
        post :create, params: {book: books_params} , format: :json
        book = JSON.parse(response.body)
        expect(response.status).to eq 200
      end
    end


    context "when user is signed in" do
      before do
        sign_in(user)
      end

      it "Updating the book" do
        books_params = {id: book.id, book: {name:"parabhu", author:"indar", description:"this is for testing", user_id:"2", edition:"2", quantity:"3"} }
        put :update, params:books_params, format: :json
        book =JSON.parse(response.body)
        expect(response.status).to eq 200
      end
    end


    context "when user is signed in" do
      before do
        sign_in(user)
      end
      
      it "Delete a book" do
        books_params = {id: book.id, book: {name:"parabhu", author:"indar", description:"this is for testing", user_id:"2", edition:"2", quantity:"3"} }
        delete :destroy, params:books_params, format: :json
        book =JSON.parse(response.body)
        expect(response.status).to eq 200
      end
    end
  end
end