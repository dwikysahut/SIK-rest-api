const express = require("express");

const Route = express.Router();
const dokumenController = require("../controllers/dokumen");
const posPayValidator = require("../validator/pos-pay");

Route.get(
  "/tagihan-pembayaran/:id",
  dokumenController.getDokumenTagihanPembayaran
)
  .get("/rincian-pembayaran/:id", dokumenController.getDokumenRincianPembayaran)
  .get("/kredit/:id", dokumenController.getDokumenKredit)
  .get("/debit/:id", dokumenController.getDokumenDebit)
  .post("/kwitansi-pembayaran", dokumenController.getKwitansiPembayaran)
  .get(
    "/public/tagihan-pembayaran",
    dokumenController.getPublicDokumenTagihanPembayaran
  )
  .get(
    "/public/bukti-pembayaran",
    dokumenController.getPublicDokumenBuktiPembayaran
  )
  .get(
    "/report/pembayaran-per-kelas",
    dokumenController.dokumenlaporanPembayaranPerKelas
  )
  .get(
    "/report/pembayaran-per-tanggal",
    dokumenController.dokumenlaporanPembayaranPerTanggal
  );

module.exports = Route;
