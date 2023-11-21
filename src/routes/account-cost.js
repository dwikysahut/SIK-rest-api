const express = require('express');

const Route = express.Router();
const accountCostController = require('../controllers/account-cost');
const accountCostValidator = require('../validator/account-cost');

Route
  .get('/', accountCostController.getAllAccountCost)
  .post('/', accountCostValidator, accountCostController.postAccountCost)
  .put('/:id', accountCostValidator, accountCostController.putAccountCost)
  .delete('/:id', accountCostValidator, accountCostController.deleteAccountCost);

module.exports = Route;
