const express = require('express');
const authController = require('../controllers/auth');

const Route = express.Router();

Route.post('/login', authController.login);
Route.post('/register', authController.register);

module.exports = Route;
