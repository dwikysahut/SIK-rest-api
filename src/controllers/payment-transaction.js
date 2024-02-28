const moment = require("moment");
const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const freePaymentModel = require("../models/free-payment");
const detailFreePaymentModel = require("../models/detail-free-payment-transaction");
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
      id,
      query.period_start,
      query.period_end
    );
    console.log("bulan nih");
    console.log(resultMonthly);
    const resultFree = await freePaymentModel.getFreePaymentByStudent(
      id,
      query.period_start,
      query.period_end
    );

    const monthlyPaymentType =
      await monthlyPaymentModel.getMonthlyPaymentTypeByStudent(id);
    const freePaymentType = await freePaymentModel.getFreePaymentTypeByStudent(
      id
    );

    const freeType = {
      free_type: freePaymentType.map((item) => ({
        ...item,
        sisa_tagihan:
          resultFree.filter(
            (itemFree) =>
              item.payment_rate_id === itemFree.payment_rate_id &&
              itemFree.payment_rate_status == 0
          )[0]?.payment_rate_bill -
          resultFree.filter(
            (itemFree) =>
              item.payment_rate_id === itemFree.payment_rate_id &&
              itemFree.payment_rate_status == 0
          )[0]?.payment_rate_discount -
          resultFree.filter(
            (itemFree) =>
              item.payment_rate_id === itemFree.payment_rate_id &&
              itemFree.payment_rate_status == 0
          )[0]?.payment_rate_total_pay,
        ...resultFree
          .filter(
            (itemFree) => item.payment_rate_id === itemFree.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          }))[0],
        sisa_tagihan_diskon: parseInt(
          resultFree
            .filter(
              (itemFree) =>
                item.payment_rate_id === itemFree.payment_rate_id &&
                itemFree.payment_rate_status == 0
            )
            .reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.payment_rate_bill, 10),
              0
            ) -
            resultFree.filter(
              (itemFree) =>
                item.payment_rate_id === itemFree.payment_rate_id &&
                itemFree.payment_rate_status == 0
            )[0]?.payment_rate_discount,
          10
        ),
      })),
    };

    const newResult = {
      ...resultSiswa,
      ...resultPayment,
      monthly_type: monthlyPaymentType.map((item) => ({
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
        monthly_payment: resultMonthly
          .filter(
            (itemMonthly) =>
              item.payment_rate_id === itemMonthly.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          })),
      })),
      ...freeType,
    };

    return helpers.response(
      res,
      200,
      "Get Pembayaran siswa berhasil",
      newResult
    );
  }),
  getHistoryPaymentByStudent: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const resultMonthly =
      await monthlyPaymentModel.getHistoryMonthlyPaymentByStudent(id);
    const resultFree = await freePaymentModel.getHistoryFreePaymentIdPayment(
      id
    );
    const resultFreeids = resultFree
      .map((item) => item.detail_payment_rate_id)
      .join(",");
    // const resultFreeDetail =
    //   await detailFreePaymentModel.getAllDetailByRangePaymentId(resultFreeids);

    const monthlyPaymentType =
      await monthlyPaymentModel.getMonthlyPaymentTypeByStudent(id);
    const freePaymentType = await freePaymentModel.getFreePaymentTypeByStudent(
      id
    );
    console.log(resultFree);
    const freeType = {
      free_type: freePaymentType.map((item) => ({
        ...item,
        detail_payment: resultFree
          .filter(
            (itemFree) => item.payment_rate_id === itemFree.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          })),
      })),
    };

    const newResult = {
      monthly_type: monthlyPaymentType.map((item) => ({
        ...item,
        monthly_payment: resultMonthly
          .filter(
            (itemMonthly) =>
              item.payment_rate_id === itemMonthly.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          })),
      })),
      ...freeType,
    };

    return helpers.response(
      res,
      200,
      "Get History Pembayaran siswa berhasil",
      newResult
    );
  }),
  getTagihanPaymentByStudent: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const resultMonthly =
      await monthlyPaymentModel.getTagihanMonthlyPaymentByStudent(id);
    const resultFree = await freePaymentModel.getTagihanFreePaymentIdPayment(
      id
    );

    const monthlyPaymentType =
      await monthlyPaymentModel.getMonthlyPaymentTypeByStudent(id);
    const freePaymentType = await freePaymentModel.getFreePaymentTypeByStudent(
      id
    );
    console.log(resultFree);
    const freeType = {
      free_type: freePaymentType.map((item) => ({
        ...item,
        detail_payment: resultFree
          .filter(
            (itemFree) => item.payment_rate_id === itemFree.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          })),
      })),
    };
    const total = [...resultFree, ...resultMonthly].reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.payment_rate_bill, 10),
      0
    );

    const newResult = {
      monthly_type: monthlyPaymentType.map((item) => ({
        ...item,
        monthly_payment: resultMonthly
          .filter(
            (itemMonthly) =>
              item.payment_rate_id === itemMonthly.payment_rate_id
          )
          .map((item) => ({
            ...item,
            payment_rate_bill: parseInt(item.payment_rate_bill),
          })),
      })),
      ...freeType,
      total_tagihan: parseInt(total),
    };

    return helpers.response(
      res,
      200,
      "Get Tagihan Pembayaran siswa berhasil",
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
      "Input Data Pembayaran bulanan siswa Berhasil",
      result
    );
  }),
  putMonthlyPaymentById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { student_student_id, payment_rate_via, payment_rate_number_pay } =
      req.body;
    const { token } = req;
    console.log(req.body);

    const newBody = {
      payment_rate_date_pay: moment().format("YYYY-MM-DD  HH:mm:ss.000"),
      payment_rate_number_pay,
      payment_rate_via: parseInt(payment_rate_via, 10) || null,
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
  putSubmitPaymentById: promiseHandler(async (req, res, next) => {
    const { data_payment, student_id } = req.body;
    const dataFree = data_payment
      .filter((item) => item.payment_type == "BEBAS")
      .map((item) => item.detail_payment_rate_id);
    const dataMonthly = data_payment
      .filter((item) => item.payment_type == "BULANAN")
      .map((item) => item.detail_payment_rate_id);
    const { token } = req;
    const monthlyIds = "";
    console.log(dataMonthly);

    const newBodyMonthly = {
      // payment_rate_date_pay: moment().format("YYYY-MM-DD  HH:mm:ss.000"),
      payment_rate_status: 1,
      is_submit_payment: 1,
    };

    const newBodyDetailFree = {
      is_submit_payment: 1,
    };

    // Using Promise.all to execute both async operations concurrently
    await Promise.all([
      paymentTransactionModel.putMonthlyPaymentSubmit(
        newBodyMonthly,
        dataMonthly
      ),
      paymentTransactionModel.putFreePaymentSubmit(newBodyDetailFree, dataFree),
    ]);
    const dataPaymentIdFromFree = data_payment
      .filter((item) => item.payment_type == "BEBAS")
      .map((item) => item.detail_payment_rate_id);

    const resultDataPaymentWithTotal =
      await freePaymentModel.getAllDetailFreePaymentTypeByIdPayment(
        dataPaymentIdFromFree
      );
    for (let i = 0; i < resultDataPaymentWithTotal.length; i++) {
      const total = resultDataPaymentWithTotal[i].total_bayar;
      const dataFreePaymentById = await freePaymentModel.getFreePaymentById(
        resultDataPaymentWithTotal[i].detail_payment_rate_id
      );
      const formBodyPayment = {
        payment_rate_total_pay: total,
        payment_rate_date_pay: payment_rate_date_pay,
        payment_rate_status:
          dataFreePaymentById.payment_rate_bill -
            dataFreePaymentById.payment_rate_discount -
            total <=
          0
            ? 1
            : 0,
      };
      await freePaymentModel.putPaymentFreePayment(
        formBodyPayment,
        dataFreePaymentById.detail_payment_rate_id
      );
    }

    const resultSiswa = await studentModel.getSiswaById(student_id);

    const setDataLog = {
      description: `${token.user_full_name} submit pembayaran siswa ${resultSiswa.student_full_name}`,
      user_user_id: token.user_id ?? null,
    };
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Submit Data Pembayaran bulanan siswa Berhasil"
    );
  }, true),
  putFreePaymentDiscountById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { payment_rate_discount, student_student_id } = req.body;
    const { token } = req;
    console.log(payment_rate_discount);

    const newBody = {
      payment_rate_discount,
    };

    const resultSiswa = await studentModel.getSiswaById(student_student_id);
    const result = await freePaymentModel.putDiscountFreePaymentById(
      newBody,
      id
    );
    const setDataLog = {
      description: `${token.user_full_name} mengubah diskon pembayaran bebas siswa ${resultSiswa.student_full_name}`,
      user_user_id: token.user_id ?? null,
    };
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Ubah Data Diskon Pembayaran bebas siswa Berhasil",
      result
    );
  }, true),
  putFreePaymentById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
      student_student_id,
      payment_rate_bebas_pay_bill,
      payment_rate_bebas_pay_desc,
      payment_rate_date_pay,
      payment_rate_via,
      payment_rate_bebas_pay_number,
    } = req.body;
    const { token } = req;

    const formBodyDetail = {
      payment_rate_bebas_pay_bill,
      is_submit_payment: 0,
      payment_rate_bebas_pay_desc,
      detail_payment_rate_id: id,
      payment_rate_via: parseInt(payment_rate_via) || null,
      payment_rate_bebas_pay_number,
    };

    await freePaymentModel.postDetailFreePayment(formBodyDetail);

    const resultDetail =
      await freePaymentModel.getDetailFreePaymentTypeByIdPayment(id);
    console.log(resultDetail);
    const total = resultDetail.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.payment_rate_bebas_pay_bill, 10),
      0
    );

    const dataFreePaymentById = await freePaymentModel.getFreePaymentById(id);
    const formBodyPayment = {
      payment_rate_total_pay: total,
      payment_rate_date_pay: payment_rate_date_pay,
      payment_rate_status:
        dataFreePaymentById.payment_rate_bill -
          dataFreePaymentById.payment_rate_discount -
          total <=
        0
          ? 1
          : 0,
    };
    const resultSiswa = await studentModel.getSiswaById(student_student_id);
    const result = await freePaymentModel.putPaymentFreePayment(
      formBodyPayment,
      id
    );
    const setDataLog = {
      description: `${token.user_full_name} mengubah pembayaran bebas siswa ${resultSiswa.student_full_name}`,
      user_user_id: token.user_id ?? null,
    };
    await logModel.postLog(setDataLog);
    return helpers.response(
      res,
      200,
      "Ubah Data Pembayaran bebas siswa Berhasil",
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
      payment_rate_via: null,
      payment_rate_number_pay: null,
      is_submit_payment: 0,
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
  getGenerateReferensiCode: promiseHandler(async (req, res, next) => {
    const { ref_code, student_id } = req.query;
    const code = ref_code;
    //from monthly payment
    const tableMonthly = "detail_payment_rate_bulan";
    const queryMonthly = `WHERE payment_rate_number_pay LIKE '${code}%' AND payment_rate.student_student_id=${student_id} AND is_submit_payment=1 AND payment_rate_number_pay IS NOT NULL  order by payment_rate_number_pay DESC`;
    const resultMonthly = await paymentTransactionModel.getReferensiCodeMonthly(
      tableMonthly,
      queryMonthly
    );
    //from monthly payment
    const queryFree = `WHERE payment_rate_bebas_pay_number LIKE '${code}%' AND payment_rate.student_student_id=${student_id} AND is_submit_payment=1 AND payment_rate_bebas_pay_number IS NOT NULL order by payment_rate_bebas_pay_number DESC`;
    const resultFree = await paymentTransactionModel.getReferensiCodeFree(
      queryFree
    );
    const newFormatResultFree = resultFree.map((item) => ({
      ...item,
      payment_rate_number_pay: item.payment_rate_bebas_pay_number,
    }));

    const newResult =
      [...newFormatResultFree, ...resultMonthly].length > 0
        ? [...newFormatResultFree, ...resultMonthly].sort(
            (a, b) => b.payment_rate_number_pay - a.payment_rate_number_pay
          )[0].payment_rate_number_pay
        : code + "00";
    const twoLastCode = newResult.substring(newResult.length - 2);
    const newIncrementCode =
      newResult.substring(0, newResult.length - 2) +
      (parseInt(twoLastCode, 10).toString().length < 2
        ? `0${parseInt(twoLastCode, 10) + 1}`
        : parseInt(twoLastCode, 10) + 1);

    return helpers.response(res, 200, "Get Referensi Code berhasil", {
      code: newIncrementCode,
      resu: [...resultFree, ...resultMonthly],
    });
  }),
  getPaymentNotSubmitted: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    //from monthly payment
    const resultMonthly =
      await paymentTransactionModel.getMonthlyPaymentNotSubmitted(id);
    //from monthly payment
    const resultFree = await paymentTransactionModel.getFreePaymentNotSubmitted(
      id
    );
    const newFormatResultFree = resultFree.map((item) => ({
      ...item,
      payment_rate_bill: parseInt(item.payment_rate_bebas_pay_bill),
      payment_rate_number_pay: item.payment_rate_bebas_pay_number,
    }));
    const concatData = [...resultMonthly, ...newFormatResultFree].map(
      (item) => ({
        ...item,
        payment_rate_bill: parseInt(item.payment_rate_bill),
      })
    );
    const newResult = {
      total: concatData.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.payment_rate_bill, 10),
        0
      ),
      data_payment: concatData,
    };

    return helpers.response(
      res,
      200,
      "Get Payment Not Submitted berhasil",
      newResult
    );
  }),
  submitAllPayment: promiseHandler(async (req, res, next) => {
    const { data_payment } = req.body;
    const dataFree = data_payment
      .filter((item) => item.payment_type == "BEBAS")
      .map((item) => item.detail_payment_rate_id);
    const dataMonthly = data_payment
      .filter((item) => item.payment_type == "BULANAN")
      .map((item) => item.detail_payment_rate_id);
    const setData = {};
    paymentTransactionModel.putFreePaymentSubmit(setData, dataMonthly);
    paymentTransactionModel.putMonthlyPaymentSubmit;
  }),
};
