const express = require("express");

const Route = express.Router();
const paymentTransactionController = require("../controllers/payment-transaction");

Route.get("/student/:id", paymentTransactionController.getPaymentByStudent);

// .get('/status/:id', kelasController.getKelasByProdi)
//   .post('/', siswaController.postSiswa)
//   .put('/:id', siswaController.putSiswa)
//   .put('/status/:id', siswaController.putStatusSiswa)
//   .delete('/:id', siswaController.deleteSiswa);

module.exports = Route;
