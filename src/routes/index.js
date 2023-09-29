const express = require('express');
const authRoutes = require('./auth');
const prodiRoutes = require('./program-studi');
const kelasRoutes = require('./kelas');
const tahunAjaranRoutes = require('./tahun-ajaran');
const statusSiswaRoutes = require('./status-siswa');
const siswaRoutes = require('./siswa');

const Routes = express.Router();

Routes.use('/auth', authRoutes);
Routes.use('/program-studi', prodiRoutes);
Routes.use('/kelas', kelasRoutes);
Routes.use('/tahun-ajaran', tahunAjaranRoutes);
Routes.use('/status-siswa', statusSiswaRoutes);
Routes.use('/siswa', siswaRoutes);

module.exports = Routes;
