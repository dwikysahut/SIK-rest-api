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
    const paymentType =
      await monthlyPaymentModel.getMonthlyPaymentTypeByStudent(id);

    const newResult = {
      ...resultSiswa,
      ...resultPayment,
      monthly_type: paymentType.map((item) => ({
        ...item,
        sisa_tagihan: resultMonthly
          .filter(
            (itemMonthly) =>
              item.payment_rate_id === itemMonthly.payment_rate_id &&
              itemMonthly.payment_rate_status == 0
          )
          .reduce(
            (accumulator, currentValue) =>
              accumulator + parseInt(currentValue.payment_rate_bill, 10),
            0
          ),
        monthly_payment: resultMonthly.filter(
          (itemMonthly) => item.payment_rate_id === itemMonthly.payment_rate_id
        ),
      })),
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
    // const checkData = await ;
    // if (!checkData) {
    //   return next(customErrorApi(404, "ID Not Found"));
    // }
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
  putMonthlyPaymentById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { student_student_id } = req.body;
    const { token } = req;

    const newBody = {
      payment_rate_date_pay: moment().format("YYYY-MM-DD  HH:mm:ss.000"),
      payment_rate_status: 1,
    };

    const resultSiswa = await studentModel.getSiswaById(student_student_id);
    const result = await monthlyPaymentModel.putMonthlyPaymentById(newBody, id);
    const setDataLog = {
      description: `${token.user_full_name} mengubah pembayaran bulanan siswa ${resultSiswa.student_full_name}`,
      user_user_id: token.user_id ?? null,
    };
    console.log(token);
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Ubah Data Pembayaran bulanan siswa Berhasil",
      result
    );
  }, true),
  deleteMonthlyPaymentById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { student_student_id } = req.body;
    const { token } = req;

    const newBody = {
      payment_rate_date_pay: null,
      payment_rate_status: 0,
    };

    const resultSiswa = await studentModel.getSiswaById(student_student_id);
    const result = await monthlyPaymentModel.putMonthlyPaymentById(newBody, id);
    const setDataLog = {
      description: `${token.user_full_name} menghapus pembayaran bulanan siswa ${resultSiswa.student_full_name}`,
      user_user_id: token.user_id ?? null,
    };
    console.log(token);
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Delete Data Pembayaran bulanan siswa Berhasil",
      result
    );
  }, true),
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
