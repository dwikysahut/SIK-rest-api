const express = require("express");

const Route = express.Router();
const kreditController = require("../controllers/kredit");
const { authentication } = require("../middleware/authMiddleware");

Route.get("/", kreditController.getAllKredit)
  .post("/", authentication, kreditController.postKredit)
  .put("/:id", authentication, kreditController.putKredit);
// .get('/status/:id', kelasController.getKelasByProdi)
//   .post('/', siswaController.postSiswa)
//   .put('/:id', siswaController.putSiswa)
//   .put('/status/:id', siswaController.putStatusSiswa)
//   .delete('/:id', siswaController.deleteSiswa);

module.exports = Route;
