const express = require('express');
const authRoutes = require('./auth');

const Routes = express.Router();

Routes.use('users', authRoutes);

module.exports = Routes;
