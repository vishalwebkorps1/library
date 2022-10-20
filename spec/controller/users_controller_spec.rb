require "rails_helper"
RSpec.describe Users::UsersController, type: :controller do
 
 
  describe "GET users#index" do
      let(:role){create(:role, name: "admin")}
      let(:user){create(:user, role: role)}
    context " when user is signed in" do
      before do
        sign_in(user)
      end

      it "It fetches all the users" do
        get :index, format: :json
        data = JSON.parse(response.body)
        expect(data.count).to eq User.all.count
      end

      it "It fetches only one users" do
        get :show, params: {id: user.id}, format: :json
        data = JSON.parse(response.body)
        expect(data['name']).to eq User.last.name
      end

      it "Updating the user" do
        #  user = create(:user)
        put_id = user.id
         user_params = {id: user.id, user: {name:"parabhu",email:"raju@gmail.com", password:"1234567", role_id:"1", address:"ashta"} }
        put :update, params:user_params, format: :json
        user = JSON.parse(response.body)
        expect(@user)
      end
      
      it "Delete user" do
        delete_id = user.id
        user_params = {id: user.id, book: {name:"parabhu",email:"raju@gmail.com", password:"1234567", role_id:"1", address:"ashta"} }
        delete :destroy, params:user_params, format: :json
        book =JSON.parse(response.body)
        expect(@book)
      end
    end
  end
end
 