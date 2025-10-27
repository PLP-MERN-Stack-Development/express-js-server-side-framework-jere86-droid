// middleware/errorHandler.js
module.exports = (err, req, res, next) => {
  console.error('Error:', err.message);
  const status = err.status || 500;
  res.status(status).json({
    error: err.name || 'ServerError',
    message: err.message || 'Something went wrong!',
  });
};
