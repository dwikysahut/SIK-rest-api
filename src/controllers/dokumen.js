const helpers = require("../helpers");
const {
  pdfGenerate,
  generateRincianPembayaran,
  generateTagihanPembayaran,
} = require("../middleware/documentService");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const freePaymentModel = require("../models/free-payment");
const detailFreePaymentModel = require("../models/detail-free-payment-transaction");
const paymentTransactionModel = require("../models/payment-transaction");
const tahunAjaranModel = require("../models/tahun-ajaran");
const studentModel = require("../models/siswa");
module.exports = {
  getDokumenTagihanPembayaran: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const dataSiswa = await studentModel.getSiswaById(id);
    const resultMonthly = await monthlyPaymentModel.getMonthlyPaymentByStudent(
      id
    );
    const resultTahunAjaran = await tahunAjaranModel.getAllTahunAjaran();
    const currentTahunAjaran = resultTahunAjaran.filter(
      (item) => item.period_status == 1
    )[0];
    const resultFree = await freePaymentModel.getFreePaymentByStudent(id);
    const allBilling = [
      ...resultMonthly.filter((item) => item.payment_rate_status == 0),
      ...resultFree
        .filter((item) => item.payment_rate_status == 0)
        .map((item) => ({
          ...item,
          payment_rate_bill:
            item.payment_rate_bill -
            item.payment_rate_discount -
            item.payment_rate_total_pay,
        })),
    ];
    const currentBilling = allBilling.filter(
      (item) =>
        item.period_start == currentTahunAjaran.period_start &&
        item.period_end == currentTahunAjaran.period_end
    );
    const previousBilling = allBilling.filter(
      (item) =>
        item.period_start < currentTahunAjaran.period_start &&
        item.period_end < currentTahunAjaran.period_end
    );
    const resultObject = {
      ...dataSiswa,
      ...currentTahunAjaran,
      currentBilling,
      previousBilling,
    };

    const result = await generateTagihanPembayaran(
      "../assets/pdfTemplate/tagihan-pembayaran.html",
      resultObject
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
    const { id } = req.params;
    const { period_start, period_end } = req.query;
    const dataSiswa = await studentModel.getSiswaById(id);
    const resultMonthly = await monthlyPaymentModel.getMonthlyPaymentByStudent(
      id,
      period_start,
      period_end
    );
    const resultFree = await freePaymentModel.getFreePaymentByStudent(
      id,
      period_start,
      period_end
    );

    const monthlyPaymentType =
      await monthlyPaymentModel.getMonthlyPaymentTypeByStudent(id);
    const freePaymentType = await freePaymentModel.getFreePaymentTypeByStudent(
      id
    );
    const listPayment = [
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
    console.log("dari sini");
    console.log(resultFree);
    console.log(resultMonthly);
    const allResult = {
      ...dataSiswa,
      period_start,
      period_end,
      sisa_tagihan: listPayment.reduce(
        (accumulator, currentValue) =>
          accumulator +
          (parseInt(currentValue.payment_rate_bebas_pay_bill, 10) -
            (currentValue.payment_rate_discount || 0) -
            currentValue.payment_rate_total_pay),
        0
      ),
      data_payment: listPayment,
    };

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
      "../assets/pdfTemplate/rincian-pembayaran.html",
      allResult
    );
    return helpers.response(
      res,
      200,
      "Get dokumen rincian pembayaran berhasil",
      result
    );
  }),
};
