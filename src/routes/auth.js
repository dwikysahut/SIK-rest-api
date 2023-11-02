const express = require('express');
const authController = require('../controllers/auth');
const authMiddleware = require('../middleware/authMiddleware');

const Route = express.Router();

Route
  .post('/login', authController.login)
  .post('/register', authController.register)
  .get('/me', authMiddleware.authentication, authController.checkMe)
  .post('/logout', authController.logout);

module.exports = Route;
