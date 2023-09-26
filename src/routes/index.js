const express = require('express');
const authRoutes = require('./auth');

const Routes = express.Router();

Routes.use('/auth', authRoutes);

module.exports = Routes;
