#API docs

##Productos

### GET /products

Retorna un arreglo de productos:

```javascript
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
```javascript
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
```javascript
POST /products
{ product: {nombre: "Nuevo nombre", precio: 20, url_imagen:"gato.jpg" } }
```
Respuesta
```javascript
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

```javascript
PUT /products/1
{ product: {nombre: "Nuevo nombre"} }
```

Respuesta
```javascript
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

```javascript
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
```javascript
{ 
  user:{
	username: "uriel",
	nombre: "Uriel",
	direccion: "Av siempre viva"
  }
}
```

##Login
```javascript
POST /sessions
{
  password: "12345678",
  username: "hola"
}
```
Response con información del usuario, incluído un token para autenticarlo en posteriores peticiones
```javascript
{
  id: 1,
  nombre: "Uriel",
  direccion: "Av Siempre Viva",
  username: "uriel",
  token: "aasd231b2eduasb2", //Debes guardar este token como si fuera la sesión
  created_at: "",
  updated_at: ""
}
```

##Purchases

###Crear una compra
```javascript
POST /purchases
{
  token: "aasd231b2eduasb2", //El token del usuario en el login
  purchase: {
    product_id: "1" // ID del producto
  }
}
```
Se responde con detalles de la compra
```javascript
{
  purchase: {
    id: "1", // Purchase ID  
    created_at:"",
    updated_at:"",
    product: {
      id: "1", //ID de la compra
      nombre: "Super producto",
      precio: 200
    },
    user: {
      id: 1,
      username: "uriel",
      direccion: "Av Siempre Viva",
      nombre: "Uriel"
    }
  }
}
```
