const express = require("express");

const Route = express.Router();
const dokumenController = require("../controllers/dokumen");
const posPayValidator = require("../validator/pos-pay");

Route.post(
  "/tagihan-pembayaran/:id",
  dokumenController.getDokumenTagihanPembayaran
);

module.exports = Route;
