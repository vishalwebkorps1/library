module Bookmaker
    module BookCreator
        extend self 
        def call(books)
            puts "Books " 
            puts books
        end
    end
end