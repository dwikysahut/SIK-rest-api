const moment = require("moment");
const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");

module.exports = {
  getMonthlyPaymentByStudent: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await monthlyPaymentModel.getMonthlyPaymentByStudent(id);
    if (!result) {
      return next(customErrorApi(404, "ID Not Found"));
    }

    return helpers.response(
      res,
      200,
      "Get Pembayaran bulanan siswa berhasil",
      result
    );
  }),

  putAlumni: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;
    console.log(body);
    const newBody = {
      ...body,
      student_last_update: moment().format("YYYY-MM-DD  HH:mm:ss.000"),
    };
    const checkData = await alumniModel.getAlumniById(id);
    if (!checkData) {
      return next(customErrorApi(404, "ID Not Found"));
    }
    const result = await alumniModel.putAlumni(id, newBody);
    return helpers.response(res, 200, "Data Siswa Berhasil Diubah", result);
  }),
  //   putStatusSiswa: promiseHandler(async (req, res, next) => {
  //     const { id } = req.params;
  //     const { body } = req;
  //     const newBody = {
  //       ...body,
  //       student_last_update: moment().format('YYYY-MM-DD  HH:mm:ss.000'),
  //     };

  //     const result = await siswaModel.putStatusSiswa(id, newBody);
  //     return helpers.response(res, 200, 'Data Siswa Berhasil Diubah', result);
  //   }),
  //   deleteSiswa: promiseHandler(async (req, res, next) => {
  //     const { id } = req.params;

  //     const checkData = await siswaModel.getSiswaById(id);
  //     if (!checkData) {
  //       return next(customErrorApi(404, 'ID Not Found'));
  //     }
  //     const result = await siswaModel.deletSiswa(id);
  //     return helpers.response(res, 200, 'Data Siswa Berhasil Dihapus', result);
  //   }),
};
