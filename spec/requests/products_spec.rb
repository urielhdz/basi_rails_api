require 'rails_helper'

RSpec.describe "Products", type: :request do
	let(:product){ FactoryGirl.create(:product) }
  describe "GET /products" do
    it "returns all products" do
      get products_path
      json_body = JSON.parse(response.body)
      expect(json_body["products"].length).to eq(Product.count)
    end
  end

  describe "GET /products/:id" do
  	it "displays a product" do
      get product_path(product)
      json_body = JSON.parse(response.body)
      expect(json_body["product"]["id"]).to eq(product.id)
    end
  end

  describe "POST /products" do
  	it "creates a new product" do
  		expect{
  			post products_path, { product: { nombre: "Nuevo producto que se la rifa", precio: 20 } }
  		}.to change(Product,:count).by(1)
  	end
  	it "renders the created product" do
  		post products_path, { product: { nombre: "Nuevo producto que se la rifa", precio: 20 } }
			json_body = JSON.parse(response.body)
  		expect(json_body["product"]["id"]).to eq(Product.last.id)
  	end
  end

  describe "PUT /products/:id" do
  	it "updates the specified fields" do
  		put product_path(product),{ product:{nombre: "Cooool"} }
  		product.reload
  		expect(product.nombre).to eq("Cooool")
  	end
  end

  describe "DELETE /products/:id" do
  	it "removes the product" do
  		product
  		expect{
  			delete product_path(product)	
  		}.to change(Product,:count).by(-1)
  	end
  end
end
