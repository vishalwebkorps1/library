class Books::IssuedbooksController < ApplicationController
  load_and_authorize_resource 


   # GET issued/index
  def index 

    # if current_user is Admin it show Issuedbooks 
    @books =  current_user.role.name == 'admin' ? Issuedbook.all : current_user.issuedbooks.all

    render json: @books, status: :ok unless @books.blank?

    #  if Book is blank it show no issue books
    if @books.blank?
      render json: {message: "no issued Books"}
    end
  end


  # POST /issued/user_id
  def issue
    # Book Issued by Book_id
    @book = Book.find_by(id: params[:issuedbook][:book_id])
    @issue = Issuedbook.find_by(book_id: @book&.id, user_id: params[:user_id].to_i)

    # If book is already Issued
    if @issue.present? && @book.id == @issue.book_id
      render json: {message: "Book Already issued"}
    else
      @issue = Issuedbook.new(book_id: @book&.id, user_id: params[:user_id].to_i)

      #  Issuedbook Saved and Updated
      if @issue.save
        @book.update(quantity: (@book.quantity.to_i - 1).to_s)

        # send mail if book was successfully issued 
        UsermailMailer.with(book_id: @book.id).welcome.deliver_later
        render json: {message: "issue successfully"}
      else
        render json: {errors: @issue.errors.full_messages}
      end
    end
  end


  # DELETE  /issued/return/:id
  def return
    # Issuedbook find by user id
    @user = Issuedbook.find_by(params[:user_id])
    #  if user is authorized to return this book book destroy and updated
    if @user&.destroy
      @book = Book.find_by(id: @user.book_id)
      @book.update(quantity: (@book.quantity.to_i + 1).to_s)
      render json: { message: 'Book returned successfully' }
    else
      render json: { message: 'Book not returned' }
    end
  end
end
































































# module Books
#   # CreateJwtDenylist
#   class IssuedbooksController < ApplicationController
    # load_and_authorize_resource
    # def index
    #   if current_user.role.name == 'admin'
    #     @books = Issuedbook.all
    #     render json: @books, status: :ok unless @books.blank?
    #     render json: { message: 'no issued Books' } if @books.blank?
    #   else
    #     @books = current_user.issuedbooks.all
    #     render json: @books
    #     # no_book
    #   end
    # end


    # # authorize! :issuedbooksController
    # def issue
    #   @book = Book.find_by(name: params[:Issuedbook]&[:name])
    #   @issue = Issuedbook&.find_by(book_id: @book&.id, user_id: params[:user_id].to_i)
    #   issuer(@book, @issue)
    # end




#     def return
#       # authorize! :return , IssuedBook
#       @user = Issuedbook.find_by(user_id: params[:user_id])
#       if @user.return
#         @book = Book.find_by(id: @user.book_id)
#         @book.update(quantity: (@book.quantity.to_i + 1).to_s)
#         render json: { message: 'Book returned successfully' }
#       else
#         render json: { message: 'Book not returned' }
#       end
#     end


# def issuer(book, issue)
#   if !issue.blank? && book&.id == issue.book_id
#     render json: { message: 'Book Already issued' }
#   else
#     issue = Issuedbook.new(book_id: book&.id, user_id: params[:user_id].to_i)
#     issuer2(book, issue)
#   end
# end


# def issuer2(book, issue)
#   if issue.save
#     book.update(quantity: (book.quantity.to_i - 1).to_s)
#     UsermailMailer.with(book_id: book.id).welcome.deliver_later
#     render json: { message: 'issue successfully' }
#   else
#     render json: { errors: issue.errors.full_messages }
#   end
# end
# end

# def index
#   if current_user.role.name == "admin"
#     @issuedbooks = Issuedbook.all
#   else
#     @issuedbooks = current_user.issuedbooks
#   end
#   if @issuedbooks.empty?
#     information({message:"there are no books to show"})
#   else
#     information({issuedbooks: gen_issued_book(many=true)})
#   end
# end

# def show

#   if current_user.role.name == "admin"
#      information gen_issued_book
#   elsif current_user.id == @issuedbook.user.id
#       information gen_issued_book
#   else
#     faliure_response("The book you're trying to view is not issued by you")
#   end
# end

 # POST /issuedbooks
#  def create
#   # only a student can issue a book
#   @issuedbook = Issuedbook.new(issuedbook_creation_params)

#   # if user enters old date for submission it will give error
#   # if @issuedbook.submittion < Date.today
#   #   faliure_response("You're entering wrong submission date.")
#   # else

#     # getting current user issued books
#     books = current_user.issuedbooks
#     array = []
#     books.each do |book|
#       if book.is_returned == false
#         array << book.book_id
#       end
#     end

#     # checking whether the user has the book already issued
#     if array.include?(@issuedbook.book&.id)
#       faliure_response("you already have this book issued")
#     else
        # if @issuedbook.book&.quantity > 0

        #   @issuedbook.book.quantity -= 1 # decreasing the quatity of the book viz., issued
        #   @issuedbook.user = current_user
        #   @issuedbook.is_returned = false
        #   @issuedbook.issued_on = Date.today
        #   @issuedbook.fine = 0.0

#           if @issuedbook.save
#             @issuedbook.book.save

#           #   # sending success issue mail to the user
#           #   UserMailer.welcome(@issuedbook).deliver_later
#           #   render json: {book_issued: gen_issued_book}, status: :created, location: @issuedbook
#           # else
#           #   handle_error @issuedbook.errors
#           # end
#         # else
#         #   faliure_response("Sorry, This Book is not available for issuing.")
#         # end
#     end
# end
# end
# # PATCH/PUT /issuedbooks/1
# def update

  # Admin can't update a returned book
  # if @issuedbook.is_returned == true
  #   faliure_response("Cant't update, the book is already returned")
  # else
#     if @issuedbook.update(issuedbook_params)
#       information gen_issued_book
#     else
#       handle_error @issuedbook.errors
#     end
#   end
# # end
# # DELETE /issuedbooks/1
# def destroy
#   if @issuedbook.destroy
#     # if @issuedbook.is_returned == false
#       # @issuedbook.book.quantity += 1 # after getting a active issue destroyed the book quantity will get increased by 1
#       success_response("IssuedBook-request deleted successfully with id: #{@issuedbook.id}, issuer_name: #{@issuedbook.user.name}, book_creator: #{@issuedbook.book.user.name}")
#     else
#       @issuedbook.book.save
#       success_response("IssuedBook-request deleted successfully with id: #{@issuedbook.id}, issuer_name: #{@issuedbook.user.name}, book_creator: #{@issuedbook.book.user.name}")
#     end
#   # else
#     faliure_response("IssuedBook-request is not deleted")
#   end
# end
 # POST /issuedbooks/return/:id
#  def return
#     @issuedbook = Issuedbook.find(params[:id])

#     # Checking whether the book is already returned or not
#     if @issuedbook.is_returned == true
#       # sending failed res
#       faliure_response("Book is already returned")
#     else
#       @issuedbook.save
#       @issuedbook.book.save
#       UserMailer.issue_return_create(@issuedbook).deliver_later
#       success_response(gen_issued_book)
#     # end
#       faliure_response("This book is not issued by you.")
#     end
#   end
  # end
    # private
    # # Use callbacks to share common setup or constraints between actions.
    # def set_issuedbook
    #   @issuedbook = Issuedbook.find(params[:id])
    # end

    # # Only allow a list of trusted parameters through.
    # def issuedbook_params
    #   params.require(:issuedbook).permit(:user_id, :book_id, :is_returned, :issued_on, :fine, :return_dt, :submittion)
    # end

    # # custom params for new issue creation by student
    # def issuedbook_creation_params
    #   params.require(:issuedbook).permit(:book_id, :submittion, :user_id)
    # end
# end





























