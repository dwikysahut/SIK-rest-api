const express = require('express');
const authRoutes = require('./auth');
const prodiRoutes = require('./program-studi');
const kelasRoutes = require('./kelas');

const Routes = express.Router();

Routes.use('/auth', authRoutes);
Routes.use('/program-studi', prodiRoutes);
Routes.use('/kelas', kelasRoutes);

module.exports = Routes;
