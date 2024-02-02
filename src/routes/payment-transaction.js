const express = require("express");

const Route = express.Router();
const paymentTransactionController = require("../controllers/payment-transaction");
const { authentication } = require("../middleware/authMiddleware");

Route.get("/student/:id", paymentTransactionController.getPaymentByStudent)
  .put(
    "/:id",
    authentication,
    paymentTransactionController.putMonthlyPaymentById
  )

  .put(
    "/delete/:id",
    authentication,
    paymentTransactionController.deleteMonthlyPaymentById
  );

// .get('/status/:id', kelasController.getKelasByProdi)
//   .post('/', siswaController.postSiswa)
//   .put('/:id', siswaController.putSiswa)
//   .put('/status/:id', siswaController.putStatusSiswa)
//   .delete('/:id', siswaController.deleteSiswa);

module.exports = Route;
