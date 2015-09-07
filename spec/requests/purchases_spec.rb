require 'rails_helper'

RSpec.describe "Purchases", type: :request do
	let(:user){ FactoryGirl.create(:user) }
	let(:product){ FactoryGirl.create(:product) }
	let(:token){ FactoryGirl.create(:token, user: user) }
  describe "POST /purchases" do
  	context "with token" do
	    it "creates a new purchase" do
	    	expect{
	    		post purchases_path, {token: token.token, purchase: { product_id: product.id } }	
	    	}.to change(Purchase,:count) 
	    end
	    context "renders data" do
	    	before :each do
	    		post purchases_path, {token: token.token, purchase: { product_id: product.id } }	
	    		@json_body = JSON.parse(response.body)
	    	end
		    it "renders the purchase" do
		    	expect(@json_body["purchase"]["id"]).to eq(Purchase.last.id)
		    end
		    it "renders info about the buyer" do
		    	expect(@json_body["purchase"]["user"]["id"]).to eq(user.id)
		    end
		    it "renders info about the product" do
		    	expect(@json_body["purchase"]["product"]["id"]).to eq(product.id)
		    end
		  end
	  end
  end
end
