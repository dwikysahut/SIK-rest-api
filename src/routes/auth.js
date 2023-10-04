const express = require('express');
const authController = require('../controllers/auth');

const Route = express.Router();

Route
  .post('/login', authController.login)
  .post('/register', authController.register)
  .post('/logout', authController.logout);

module.exports = Route;
