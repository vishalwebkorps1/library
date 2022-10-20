FactoryBot.define do

    factory (:user) do 
        email {"admin@gmail.com"}
        password {"1234567"}
        address {"aaaaaaaaaaaaaaaaaaaaaa"}
        name {"John Doe"}
        role
    end
    factory (:role) do 
      name {"user"}
    end
    
    factory (:book) do
      name  { "The Great India" }
      author {"Indian Times "}
      description {"This is for civilazation"}
      edition {"1"}
      quantity {"5"}
      user {create(:user,email: 'new@example.com')}
    end

end
