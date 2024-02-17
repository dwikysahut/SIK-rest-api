const helpers = require("../helpers");
const {
  pdfGenerate,
  generateRincianPembayaran,
} = require("../middleware/documentService");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const freePaymentModel = require("../models/free-payment");
const detailFreePaymentModel = require("../models/detail-free-payment-transaction");
const paymentTransactionModel = require("../models/payment-transaction");
const studentModel = require("../models/siswa");
module.exports = {
  getDokumenTagihanPembayaran: promiseHandler(async (req, res, next) => {
    const result = await pdfGenerate(
      "../assets/pdfTemplate/tagihan-pembayaran.html"
    );
    console.log(result);
    return helpers.response(
      res,
      200,
      "GET dokumen tagihan pembayaran berhasil",
      result
    );
  }),
  getDokumenRincianPembayaran: promiseHandler(async (req, res, next) => {
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
    const allResult = [
      ...resultFree
        .filter((item) =>
          freePaymentType.some(
            (itemFilter) => item.payment_rate_id === itemFilter.payment_rate_id
          )
        )
        .map((item) => ({
          ...item,
          payment_rate_bill: parseInt(item.payment_rate_bill),
        })),
      ,
      ...resultMonthly
        .filter((item) =>
          monthlyPaymentType.some(
            (itemFilter) => item.payment_rate_id === itemFilter.payment_rate_id
          )
        )
        .map((item) => ({
          ...item,
          payment_rate_bill: parseInt(item.payment_rate_bill),
        })),
      ,
    ];
    // const freeType = {
    //   free_type: freePaymentType.map((item) => ({
    //     ...item,
    //     detail_payment: resultFree
    //       .filter(
    //         (itemFree) => item.payment_rate_id === itemFree.payment_rate_id
    //       )
    //       .map((item) => ({
    //         ...item,
    //         payment_rate_bill: parseInt(item.payment_rate_bill),
    //       })),
    //   })),
    // };

    // const newResult = {
    //   monthly_type: monthlyPaymentType.map((item) => ({
    //     ...item,
    //     monthly_payment: resultMonthly
    //       .filter(
    //         (itemMonthly) =>
    //           item.payment_rate_id === itemMonthly.payment_rate_id
    //       )
    //       .map((item) => ({
    //         ...item,
    //         payment_rate_bill: parseInt(item.payment_rate_bill),
    //       })),
    //   })),
    //   ...freeType,
    // };
    const result = await generateRincianPembayaran(
      "../assets/pdfTemplate/rincian-pembayaran.html"
    );
    console.log(result);
    return helpers.response(
      res,
      200,
      "Get dokumen rincian pembayaran berhasil",
      result
    );
  }),
};
