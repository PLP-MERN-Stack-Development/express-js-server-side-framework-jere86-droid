Perfect ✅ Let’s create a clear, professional **README.md** file for your Express.js REST API project — including setup instructions, routes, and usage (Postman testing included).

---

## 📝 **README.md**

````markdown
# 🛒 Products REST API (Express.js)

A simple RESTful API built with **Express.js** to manage products.  
Includes CRUD operations, middleware (logger, auth, validation), error handling, and advanced features like filtering, pagination, and search.

---

## 🚀 Features
- Basic Express.js server setup
- RESTful routes for products (CRUD)
- Middleware:
  - Custom request logger
  - JSON body parser
  - API key authentication
  - Input validation
- Global error handling
- Filtering, pagination & search
- Product statistics by category

---

## 🛠️ Technologies Used
- Node.js
- Express.js
- Body-parser
- Nodemon (for development)

---

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd <project-folder>
````

2. **Initialize Node.js**

   ```bash
   npm init -y
   ```

3. **Install dependencies**

   ```bash
   npm install express body-parser dotenv
   npm install --save-dev nodemon
   ```

4. **Create environment file**

   ```bash
   touch .env
   ```

   Add your API key:

   ```
   
API_KEY=mysecretapikey123
   ```

5. **Run the server**

   ```bash
   npm run dev
   ```

   or

   ```bash
   node server.js
   ```

   Server runs at:
   👉 `http://localhost:3000`

---

## 🧩 API Endpoints

| Method     | Endpoint                         | Description                                         |
| ---------- | -------------------------------- | --------------------------------------------------- |
| **GET**    | `/`                              | Hello World                                         |
| **GET**    | `/api/products`                  | List all products (supports pagination & filtering) |
| **GET**    | `/api/products/:id`              | Get a product by ID                                 |
| **POST**   | `/api/products`                  | Create a new product                                |
| **PUT**    | `/api/products/:id`              | Update an existing product                          |
| **DELETE** | `/api/products/:id`              | Delete a product                                    |
| **GET**    | `/api/products/search?name=term` | Search product by name                              |
| **GET**    | `/api/products/stats`            | Get product count by category                       |

---

## 🧠 Middleware

* **Logger**: Logs each request method, URL, and timestamp
* **Auth**: Requires header `x-api-key: <API_KEY>`
* **Validator**: Ensures valid product data
* **Error Handler**: Handles and formats all server errors

---

## 🔍 Query Parameters

| Parameter  | Type   | Description                 |
| ---------- | ------ | --------------------------- |
| `category` | string | Filter products by category |
| `page`     | number | Pagination page number      |
| `limit`    | number | Number of products per page |

Example:

```
GET /api/products?category=electronics&page=1&limit=5
```

---

## 🧪 Testing with Postman

1. Open **Postman Desktop App**
2. Make sure your server is running:

   ```
   node server.js
   ```
3. In Postman, set:

   * **Method:** (GET, POST, PUT, DELETE)
   * **URL:** `http://localhost:3000/api/products`
   * **Headers:**

     ```
     x-api-key: API_KEY=mysecretapikey123
     Content-Type: application/json
     ```
4. For `POST` or `PUT`, use **Body → raw → JSON**:

   ```json
   {
     "name": "iPhone 14",
     "description": "Latest Apple phone",
     "price": 1200,
     "category": "electronics",
     "inStock": true
   }
   ```

---

## 📊 Example Stats Response

**GET /api/products/stats**

```json
{
  "electronics": 5,
  "fashion": 3,
  "home": 2
}
```

---

## ⚠️ Error Handling

All errors return a consistent format:

```json
{
  "error": "NotFoundError",
  "message": "Product not found"
}
```

---

## 🧑‍💻 Author

**Jeremy Mutunga**


---

## 📄 License

MIT License © 2025 Jeremy Mutunga
