#API docs

##Productos

### GET /products

Retorna un arreglo de productos:

```
{
  products: [
    {
     id: 1,
     nombre: "Hola mundo",
     descripcion: "Hola otro mundo",
     precio: 20,
     url_imagen: "imagen.jpg",
     url: "http://localhost:3000/products/1.json"
    }
  ]
}
```

### GET products/:id

Retorna un producto
```
{
  product: {
   id: 1,
   nombre: "Hola mundo",
   descripcion: "Hola otro mundo",
   precio: 20,
   url_imagen: "imagen.jpg",
   created_at: "2015-09-07T17:41:45.916Z",
   updated_at: "2015-09-07T17:41:45.916Z"
  }
}
```

###POST products
Crea un nuevo producto y responde con el producto creado. Ejemplo petición:
```
POST /products
{ product: {nombre: "Nuevo nombre", precio: 20, url_imagen:"gato.jpg" } }
```
Respuesta
```
{
  product: {
   id: 1,
   nombre: "Hola mundo",
   descripcion:"",
   precio: 20,
   url_imagen: "gato.jpg",
   created_at: "2015-09-07T17:41:45.916Z",
   updated_at: "2015-09-07T17:41:45.916Z"
  }
}
```


### PUT products/:id
Recibe un hash `product` con los atributos a modificar del producto, responde con el producto que se actualizó. Ejemplo de petición:

```
PUT /products/1
{ product: {nombre: "Nuevo nombre"} }
```

Respuesta
```
{
  product: {
   id: 1,
   nombre: "Nuevo nombre",
   descripcion: "Hola otro mundo",
   precio: 20,
   url_imagen: "imagen.jpg",
   created_at: "2015-09-07T17:41:45.916Z",
   updated_at: "2015-09-07T17:41:45.916Z"
  }
}
```

### DELETE products/:id

No retorna nada si se completó la eliminación


## Usuarios


### POST /users
Crea un nuevo usuario con los parámetros enviados. Ejemplo de petición:

```
POST /users
{ user: {
			username: "uriel", 
			password: "12345678", 
			nombre: "Uriel"
			password_confirmation: "12345678",
			direccion: "Av siempre viva"
		}
}
```
Responde con el usuario creado:
```
{ 
  user:{
	username: "uriel",
	nombre: "Uriel",
	direccion: "Av siempre viva"
  }
}
```
