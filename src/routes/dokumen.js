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
  )
  .get(
    "/report/laporan-kas-bank",
    dokumenController.dokumenLaporanKasBank
  )
  .get(
    "/report/laporan-kas-tunai",
    dokumenController.dokumenLaporanKasTunai
  )
  .get(
    "/report/laporan-jurnal-umum",
    dokumenController.dokumenLaporanJurnalUmum
  )
  .get(
    "/report/laporan-kas-bank/anggaran",
    dokumenController.dokumenLaporanKasBankPerAnggaran
  )
  .get(
    "/report/laporan-kas-tunai/anggaran",
    dokumenController.dokumenLaporanKasTunaiPerAnggaran
  )
  .get(
    "/report/laporan-kas-bank/anggaran",
    dokumenController.dokumenLaporanKasBankPerAnggaran
  )
  .get(
    "/report/laporan-jurnal-umum/anggaran",
    dokumenController.dokumenLaporanJurnalPerAnggaran
  )

module.exports = Route;
