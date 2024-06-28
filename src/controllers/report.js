const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const siswaModel = require("../models/siswa");
const freePaymentModel = require("../models/free-payment");
const paymentTypeModel = require("../models/payment-type");
const studentModel = require("../models/siswa");
const helpers = require("../helpers");

module.exports = {
  laporanPembayaranPerKelas: promiseHandler(async (req, res, next) => {
    const { unit_id, class_id, period_id, payment_type } = req.query;
    const queryFormat = {};
    console.log(class_id);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    const queryToString = helpers.queryToString(queryFormat);

    const resultSiswa = await siswaModel.getAllSiswa(queryToString);
    const resultMonthly = await monthlyPaymentModel.getTagihanMonthlyPaymentAllStudentByPos(
      unit_id,
      class_id,
      period_id,
      payment_type
    );
    const resultFree = await freePaymentModel.getTagihanFreePaymentAllStudentByPos(
      unit_id,
      class_id,
      period_id,
      payment_type
    );
    // const idsMonthly = [...new Set(resultMonthly.map((item) => item.payment_rate_id))].join(",");
    // console.log(resultMonthly);
    // const monthlyPaymentType =
    //   idsMonthly.length > 0 ? await monthlyPaymentModel.getMonthlyPaymentTypeAllStudentByPaymentQuery(idsMonthly) : [];

    // const idsFree = [...new Set(resultMonthly.map((item) => item.payment_rate_id))].join(",");
    // console.log(class_id);
    // console.log(resultMonthly);
    // console.log(resultFree);

    const total = [...resultFree, ...resultMonthly].reduce(
      (accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10),
      0
    );
    const newResult = resultSiswa.map((student) => ({
      ...student,
      total_tagihan:
        parseInt(resultFree.filter((item) => item.student_student_id == student.student_id)[0]?.payment_rate_bill, 10) +
        resultMonthly
          .filter((item) => item.student_student_id == student.student_id)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0),
      sisa_tagihan:
        parseInt(
          resultFree.filter((item) => item.student_student_id == student.student_id)[0]
            ?.payment_rate_bebas_pay_remaining,
          10
        ) +
        resultMonthly
          .filter((item) => item.student_student_id == student.student_id && item.payment_rate_status == 0)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0),
      sudah_dibayar:
        parseInt(resultFree.filter((item) => item.student_student_id == student.student_id)[0]?.payment_rate_bill, 10) -
        parseInt(
          resultFree.filter((item) => item.student_student_id == student.student_id)[0]
            ?.payment_rate_bebas_pay_remaining,
          10
        ) +
        resultMonthly
          .filter((item) => item.student_student_id == student.student_id && item.payment_rate_status == 1)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0),
    }));
    return helpers.response(res, 200, "GET Data Laporan pembayaran per kelas berhasil", newResult);
  }),
  laporanPembayaranPerTanggal: promiseHandler(async (req, res, next) => {
    const { unit_id, class_id, period_id, payment_type, tanggal_awal, tanggal_akhir } = req.query;
    const queryFormat = {};
    console.log(class_id);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    const queryToString = helpers.queryToString(queryFormat);

    const resultSiswa = await siswaModel.getAllSiswa(queryToString);
    const resultMonthly = await monthlyPaymentModel.getTagihanMonthlyPaymentAllStudentByPosWithDate(
      unit_id,
      class_id,
      period_id,
      tanggal_awal, tanggal_akhir
    );
    console.log(resultMonthly)
    const resultFree = await freePaymentModel.getTagihanFreePaymentAllStudentByPosWithDate(
      unit_id,
      class_id,
      period_id,
      tanggal_awal, tanggal_akhir
    );
    const query = `WHERE unit_unit_id=${unit_id} && period_period_id=${period_id}`
    const resultPaymentType = await paymentTypeModel.getAllPaymentType(query);

    const newResultPayment = resultPaymentType.map(item => ({ ...item, payment: [...resultMonthly.filter(itemMonthly => item.payment_id == itemMonthly.payment_id), ...resultFree.filter(itemMonthly => item.payment_id == itemMonthly.payment_id)] }))
    return helpers.response(res, 200, "GET Data Laporan pembayaran per kelas berhasil", newResultPayment);
  }),
  laporanTagihanSiswa: promiseHandler(async (req, res, next) => {
    const { class_id, period_id, unit_id, tanggal_awal, tanggal_akhir } = req.query;
    const queryFormat = {};
    console.log(class_id);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    const queryToString = helpers.queryToString(queryFormat);

    const result = await studentModel.getAllSiswa(queryToString);
    const resultMonthly = await monthlyPaymentModel.getTagihanMonthlyPaymentAllStudentWithDate(
      unit_id || "",
      class_id || "",
      period_id || "",
      tanggal_awal,
      tanggal_akhir
    );
    const resultFree = await freePaymentModel.getTagihanFreePaymentAllStudentWithDate(
      unit_id || "",
      class_id || "",
      period_id || "",
      tanggal_awal,
      tanggal_akhir
    );

    const newResult = result.map((student) => ({
      ...student,
      total_tagihan:
        resultMonthly
          .filter((item) => item.student_id == student.student_id)
          ?.reduce((accumulator, currentValue) => accumulator + parseFloat(currentValue.payment_rate_bill, 10), 0) +
        (resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bebas_pay_remaining !==
          undefined
          ? resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bebas_pay_remaining
          : 0),
    }));
    return helpers.response(res, 200, "Get All Tagihan siswa berhasil", newResult);

  }),
  laporanRekapPembayaran: promiseHandler(async (req, res, next) => {
    // const { class_id, period_id, unit_id, tanggal_awal, tanggal_akhir } = req.query;
    // const queryFormat = {};
    // console.log(class_id);
    // // untuk penyesuaian query di sql
    // queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    // queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    // const queryToString = helpers.queryToString(queryFormat);

    // const result = await studentModel.getAllSiswa(queryToString);
    // const resultMonthly = await monthlyPaymentModel.getTagihanMonthlyPaymentAllStudentWithDate(
    //   unit_id || "",
    //   class_id || "",
    //   period_id || "",
    //   tanggal_awal,
    //   tanggal_akhir
    // );
    // const resultFree = await freePaymentModel.getTagihanFreePaymentAllStudentWithDate(
    //   unit_id || "",
    //   class_id || "",
    //   period_id || "",
    //   tanggal_awal,
    //   tanggal_akhir
    // );

    // const newResult = result.map((student) => ({
    //   ...student,
    //   total_tagihan:
    //     resultMonthly
    //       .filter((item) => item.student_id == student.student_id)
    //       ?.reduce((accumulator, currentValue) => accumulator + parseFloat(currentValue.payment_rate_bill, 10), 0) +
    //     (resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bebas_pay_remaining !==
    //       undefined
    //       ? resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bebas_pay_remaining
    //       : 0),
    // }));
    // return helpers.response(res, 200, "Get All Tagihan siswa berhasil", newResult);

  })
};
