const express = require("express");

const Route = express.Router();
const kreditController = require("../controllers/kredit");
const { authentication } = require("../middleware/authMiddleware");

Route.get("/", kreditController.getAllKredit)
  .post(
    "/not-submitted",
    authentication,
    kreditController.postKreditNotSubmitted
  )
  .post("/submitted", authentication, kreditController.postKreditSubmitted)
  .get("/not-submitted", authentication, kreditController.getKreditNotSubmitted)
  .put("/:id", authentication, kreditController.putKredit)
  .post("/no-ref", authentication, kreditController.generateNoRef)
  // .get('/status/:id', kelasController.getKelasByProdi)
  //   .post('/', siswaController.postSiswa)
  //   .put('/:id', siswaController.putSiswa)
  //   .put('/status/:id', siswaController.putStatusSiswa)
  .delete("/not-submitted/:id", kreditController.deleteKredit);

module.exports = Route;
