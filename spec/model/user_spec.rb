 require "rails_helper"

 RSpec.describe User, type:  :model do
  subject { User.new(name: 'John', email: 'john@example.com', address: 'ashta', password: '1234567' ) }

	before{subject.save}

  it 'name should be presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'address should be presence' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  it 'password should be presence' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'email should be presence' do
    subject.email = nil
    expect(subject).to_not be_valid
  end



end

		















# 	it "is valid with valid attributes " do
# 		expect(@user).to be_valid
# 	end
# 	it "has a unique name" do
# 		user2 = build(:user, email: "bob@gmail.com")
# 		expect(user2).to_not be_valid
#   end
# 	it "has a unique email" do
# 		user2 = build(:user, username: "Bob")
# 		expect(user2).to_not be_valid
#   end
# 	it "is not valid without a password" do 
# 		user2 = build(:user, password: nil)
# 		expect(user2).to_not be_valid
#   end
# 	it "is not valid without a username" do 
# 		user2 = build(:user, username: nil)
# 		expect(user2).to_not be_valid
# 	end
# 	it "is not valid without an email" do
# 		user2 = build(:user, email: nil)
# 		expect(user2).to_not be_valid
#   end
# end

    
    

    

    
    

    

    

      


  
