const moment = require("moment");
const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const paymentTransactionModel = require("../models/payment-transaction");
const studentModel = require("../models/siswa");
const logModel = require("../models/log");
const log = require("../models/log");

module.exports = {
  getPaymentByStudent: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { query } = req;
    const resultSiswa = await studentModel.getSiswaById(id);
    if (!resultSiswa) {
      return next(customErrorApi(404, "ID Not Found"));
    }
    const resultPayment =
      await paymentTransactionModel.getPaymentTransactionByStudent(id, {
        period_start: query.period_start,
        period_end: query.period_end,
      });
    const resultMonthly = await monthlyPaymentModel.getMonthlyPaymentByStudent(
      id
    );

    const newResult = {
      ...resultSiswa,
      ...resultPayment,
      monthly_payment: [...resultMonthly],
    };

    return helpers.response(
      res,
      200,
      "Get Pembayaran bulanan siswa berhasil",
      newResult
    );
  }),

  putMonthlyPayment: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;

    const newBody = {
      payment_rate_date_pay: moment().format("YYYY-MM-DD  HH:mm:ss.000"),
      payment_rate_bill: body.payment_rate_bill,
    };
    const checkData = await deta;
    if (!checkData) {
      return next(customErrorApi(404, "ID Not Found"));
    }
    const result = await monthlyPaymentModel.putMonthlyPayment(id, newBody);
    const setDataLog = {
      description: `Input pembayaran bulanan siswa ${body.student_student_id}`,
      user_user_id: body.user_user_id,
    };
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Post Data Pembayaran bulanan siswa Berhasil",
      result
    );
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
