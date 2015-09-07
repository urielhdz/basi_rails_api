json.products(@products) do |product|
  json.extract! product, :id, :nombre, :descripcion, :precio, :url_imagen
  json.url product_url(product, format: :json)
end
