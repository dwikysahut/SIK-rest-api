const express = require("express");

const Route = express.Router();
const monthlyPaymentController = require("../controllers/monthly-payment");

Route.get("/student/:id", monthlyPaymentController.getMonthlyPaymentByStudent);

// .get('/status/:id', kelasController.getKelasByProdi)
//   .post('/', siswaController.postSiswa)
//   .put('/:id', siswaController.putSiswa)
//   .put('/status/:id', siswaController.putStatusSiswa)
//   .delete('/:id', siswaController.deleteSiswa);

module.exports = Route;
