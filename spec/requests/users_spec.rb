require 'rails_helper'

RSpec.describe "Users", type: :request do
	let(:valid_attrs){
		{
			username: "uriel", password: "12345678", 
			password_confirmation: "12345678",
			direccion: "Av siempre viva"
		}
	}
	let(:user){ FactoryGirl.create(:user) }
  describe "POST /users" do
    it "creates a new user" do
    	expect{
    		post users_path, { user: valid_attrs }
    	}.to change(User,:count).by(1)
      
    end
  end

  describe "GET /users/:id" do
  	it "returns the user" do
  		get user_path(user)
  		json_body = JSON.parse(response.body)
  		expect(json_body["user"]["id"]).to eq(user.id)
  	end
  	it "returns the token if exists" do
  		token = FactoryGirl.create(:token, user: user)
  		get user_path(user)
  		json_body = JSON.parse(response.body)
  		expect(json_body["user"]["token"]).to eq(token.token)
  	end
    it "does not render a token if does not exists" do
      get user_path(user)
      json_body = JSON.parse(response.body)
      expect(json_body["user"]["token"]).to be_nil
    end
  end
end
