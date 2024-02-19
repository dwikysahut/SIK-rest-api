const express = require("express");

const Route = express.Router();
const dokumenController = require("../controllers/dokumen");
const posPayValidator = require("../validator/pos-pay");

Route.get(
  "/tagihan-pembayaran/:id",
  dokumenController.getDokumenTagihanPembayaran
).get("/rincian-pembayaran/:id", dokumenController.getDokumenRincianPembayaran);

module.exports = Route;
