const express = require('express');

const Route = express.Router();
const paymentRateController = require('../controllers/payment-rate');
// const paymentRateValidator = require('../validator/payment-rate');

Route
  .get('/:id', paymentRateController.getAllPaymentRateByPayment)
  .get('/detail/:id', paymentRateController.getPaymentRateById)
  .post('/month/class', paymentRateController.postMonthlyPaymentRateByClass)
  .post('/month/student', paymentRateController.postMonthlyPaymentRateByStudent)
  .post('/free/class', paymentRateController.postFreePaymentRateByClass)
  .post('/free/student', paymentRateController.postFreePaymentRateByStudent);
// .put('/:id', paymentRateController.putPaymentRate)
// .delete('/:id', paymentRateController.deletePaymentRate);

module.exports = Route;
