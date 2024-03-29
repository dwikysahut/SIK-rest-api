const express = require("express");

const Route = express.Router();
const cashAccountController = require("../controllers/cash-account");

Route.get("/", cashAccountController.getAllCashAccount);

module.exports = Route;
