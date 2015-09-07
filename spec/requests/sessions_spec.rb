require 'rails_helper'

RSpec.describe "Purchases", type: :request do
	let(:user){ FactoryGirl.create(:user)}
  describe "POST /sessions" do
  	context "valid credentials" do
	    it "creates a new token" do
	      expect{
	      	post sessions_path, { username: user.username, password: "MyString"}
	      }.to change(Token,:count)
	    end

	    it "renders the user" do
	    	post sessions_path, { username: user.username, password: "MyString"}
	    	json_body = JSON.parse(response.body)
	    	expect(json_body["user"]["token"]).to eq(Token.last.token)
	    end
	  end
	  context "invalid credentials" do
	  	it "does not creates tokens" do
	  		expect{
	      	post sessions_path, { username: user.username, password: "MyStrings"}
	      }.to_not change(Token,:count)
	  	end

	  end
  end
end
