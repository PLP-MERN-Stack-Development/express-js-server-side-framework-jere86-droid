// routes/products.js
const express = require('express');
const { v4: uuidv4 } = require('uuid');
const router = express.Router();

// In-memory product data
let products = [
  { id: '1', name: 'Laptop', description: 'High-performance laptop', price: 1200, category: 'electronics', inStock: true },
  { id: '2', name: 'Phone', description: '128GB smartphone', price: 800, category: 'electronics', inStock: true },
  { id: '3', name: 'Coffee Maker', description: 'Makes great coffee', price: 50, category: 'kitchen', inStock: false },
];

// Validation middleware
function validateProduct(req, res, next) {
  const { name, description, price, category, inStock } = req.body;
  if (!name || !description || typeof price !== 'number' || !category || typeof inStock !== 'boolean') {
    const err = new Error('Invalid product data');
    err.status = 400;
    return next(err);
  }
  next();
}

// GET all products (with optional filtering & pagination)
router.get('/', (req, res) => {
  let result = [...products];
  const { category, page = 1, limit = 2, search } = req.query;

  if (category) result = result.filter(p => p.category === category);
  if (search) result = result.filter(p => p.name.toLowerCase().includes(search.toLowerCase()));

  const start = (page - 1) * limit;
  const paginated = result.slice(start, start + parseInt(limit));

  res.json({ total: result.length, page: parseInt(page), products: paginated });
});

// GET product by ID
router.get('/:id', (req, res, next) => {
  const product = products.find(p => p.id === req.params.id);
  if (!product) {
    const err = new Error('Product not found');
    err.status = 404;
    return next(err);
  }
  res.json(product);
});

// POST create product
router.post('/', validateProduct, (req, res) => {
  const newProduct = { id: uuidv4(), ...req.body };
  products.push(newProduct);
  res.status(201).json(newProduct);
});

// PUT update product
router.put('/:id', validateProduct, (req, res, next) => {
  const index = products.findIndex(p => p.id === req.params.id);
  if (index === -1) {
    const err = new Error('Product not found');
    err.status = 404;
    return next(err);
  }
  products[index] = { ...products[index], ...req.body };
  res.json(products[index]);
});

// DELETE product
router.delete('/:id', (req, res, next) => {
  const index = products.findIndex(p => p.id === req.params.id);
  if (index === -1) {
    const err = new Error('Product not found');
    err.status = 404;
    return next(err);
  }
  products.splice(index, 1);
  res.json({ message: 'Product deleted successfully' });
});

// GET product statistics
router.get('/stats/all', (req, res) => {
  const stats = products.reduce((acc, p) => {
    acc[p.category] = (acc[p.category] || 0) + 1;
    return acc;
  }, {});
  res.json({ totalProducts: products.length, countByCategory: stats });
});

module.exports = router;
