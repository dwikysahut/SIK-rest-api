const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const siswaModel = require("../models/siswa");
const freePaymentModel = require("../models/free-payment");
const paymentTypeModel = require("../models/payment-type");
const paymentTransactionModel = require("../models/payment-transaction");
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

    const total = [...resultFree, ...resultMonthly].reduce(
      (accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10),
      0
    );
    const newResult = resultSiswa.map((student) => ({
      ...student,
      total_tagihan:
        (parseInt(resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bill, 10) || 0) +
        (resultMonthly
          .filter((item) => item.student_id == student.student_id)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0) || 0),
      rsult_free: (parseInt(resultFree.filter((item) => item.student_student_id == student.student_id)[0]?.payment_rate_bill, 10) || 0),
      rsult_month: resultMonthly
        .filter((item) => item.student_id == student.student_id)
        .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0),

      sisa_tagihan:
        (parseInt(
          resultFree.filter((item) => item.student_id == student.student_id)[0]
            ?.payment_rate_bebas_pay_remaining,
          10
        ) || 0) +
        (resultMonthly
          .filter((item) => item.student_id == student.student_id && item.payment_rate_status == 0)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0) || 0),
      sudah_dibayar:
        (parseInt(resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bill, 10) || 0) -
        (parseInt(
          resultFree.filter((item) => item.student_id == student.student_id)[0]
            ?.payment_rate_bebas_pay_remaining,
          10
        ) || 0) +
        (resultMonthly
          .filter((item) => item.student_id == student.student_id && item.payment_rate_status == 1)
          .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0) || 0),
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

    const newResultPayment = resultPaymentType.map(item => ({
      ...item, payment: [...resultMonthly.filter(itemMonthly => item.payment_id == itemMonthly.payment_id), ...resultFree.filter(itemFree => item.payment_id == itemFree.payment_id)], total: (resultFree.filter(itemFree => item.payment_id == itemFree.payment_id).reduce(
        (accumulator, currentValue) =>
          accumulator + parseFloat(currentValue.payment_rate_bebas_pay_bill, 10),
        0
      ) || 0) + (resultMonthly.filter(itemFree => item.payment_id == itemFree.payment_id).reduce(
        (accumulator, currentValue) =>
          accumulator + parseFloat(currentValue.payment_rate_bill, 10),
        0
      ) || 0),
    }))
    return helpers.response(res, 200, "GET data Laporan pembayaran per tanggal berhasil", newResultPayment);
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
    const freeIds = resultFree.map(item => item.payment_payment_id)
    const monthlyIds = resultMonthly.map(item => item.payment_payment_id)
    const allIds = [...new Set([...freeIds, ...monthlyIds])]
    const regex = /,\s*$/;

    const paymentTypeResult = await paymentTypeModel.getPaymentTypeByIds(allIds.join(',').replace(regex, '' ?? ''))
    console.log(resultMonthly
      .filter((item) => item.student_id == 1 && item.payment_payment_id == 91))
    console.log('masuk')
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
      detail: paymentTypeResult.filter(item => item.student_student_id == student.student_id)?.map(itemPayment => ({
        ...itemPayment, total: resultMonthly
          .filter((item) => item.student_id == student.student_id && item.payment_payment_id == itemPayment.payment_id)
          ?.reduce((accumulator, currentValue) => accumulator + parseFloat(currentValue.payment_rate_bill, 10), 0) +
          (resultFree.filter((item) => item.student_id == student.student_id && item.payment_payment_id == itemPayment.payment_id)[0]?.payment_rate_bebas_pay_remaining !==
            undefined
            ? resultFree.filter((item) => item.student_id == student.student_id && item.payment_payment_id == itemPayment.payment_id)[0]?.payment_rate_bebas_pay_remaining
            : 0),
      })),
      result_month: resultMonthly
        .filter((item) => item.student_id == student.student_id),
      result_free: resultFree
        .filter((item) => item.student_id == student.student_id),

    }));
    return helpers.response(res, 200, "Get Laporan Tagihan siswa berhasil", newResult);

  }),
  laporanRekapPembayaran: promiseHandler(async (req, res, next) => {
    const { class_id, period_id, unit_id, } = req.query;
    const queryFormat = {};
    console.log(class_id);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    const queryToString = helpers.queryToString(queryFormat);

    const resultSiswa = await studentModel.getAllSiswa(queryToString);

    const resultMonthly = await monthlyPaymentModel.getAllMonthlyPaymentAllStudent(
      unit_id || "",
      class_id || "",
      period_id || "",

    );
    const resultFree = await freePaymentModel.getAllFreePaymentAllStudent(
      unit_id || "",
      class_id || "",
      period_id || "",
    );
    const resultFreeSortRemaining = resultFree.sort((a, b) => b.payment_rate_bebas_pay_remaining - a.payment_rate_bebas_pay_remaining)

    const ids = resultSiswa.map(item => item.student_id).join(',');
    const monthlyPaymentType = await monthlyPaymentModel.getMonthlyPaymentTypeAllStudentByPaymentQuery(ids);
    const freePaymentType = await freePaymentModel.getFreePaymentTypeByStudent(ids);
    // console.log(resu)
    const filterByMonthType = monthlyPaymentType.map(item => ({ ...item, detail: resultMonthly.filter(itemMonthly => itemMonthly.payment_rate_id == item.payment_rate_id) }));
    const filterByFreeType = freePaymentType.map(item => ({ ...item, detail: resultFreeSortRemaining.filter(itemFree => itemFree.payment_rate_id == item.payment_rate_id) }));
    console.log(filterByMonthType)

    const resultWithStudent = resultSiswa.map(item => ({ ...item, payment_type: [...filterByMonthType, ...filterByFreeType].filter(itemFilter => itemFilter.student_student_id == item.student_id) }))
    // const freeType = {
    //   free_type: freePaymentType.map((item) => ({
    //     ...item,
    //     sisa_tagihan:
    //       resultFree.filter(
    //         (itemFree) => item.payment_rate_id === itemFree.payment_rate_id && itemFree.payment_rate_status == 0
    //       )[0]?.payment_rate_bill -
    //       resultFree.filter(
    //         (itemFree) => item.payment_rate_id === itemFree.payment_rate_id && itemFree.payment_rate_status == 0
    //       )[0]?.payment_rate_discount -
    //       resultFree.filter(
    //         (itemFree) => item.payment_rate_id === itemFree.payment_rate_id && itemFree.payment_rate_status == 0
    //       )[0]?.payment_rate_total_pay,
    //     ...resultFree
    //       .filter((itemFree) => item.payment_rate_id === itemFree.payment_rate_id)
    //       .map((item) => ({
    //         ...item,
    //         payment_rate_bill: parseInt(item.payment_rate_bill),
    //       }))[0],
    //     sisa_tagihan_diskon: parseInt(
    //       resultFree
    //         .filter(
    //           (itemFree) => item.payment_rate_id === itemFree.payment_rate_id && itemFree.payment_rate_status == 0
    //         )
    //         .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0) -
    //       resultFree.filter(
    //         (itemFree) => item.payment_rate_id === itemFree.payment_rate_id && itemFree.payment_rate_status == 0
    //       )[0]?.payment_rate_discount,
    //       10
    //     ),
    //   })),
    // };

    // const newResult = {
    //   ...resultSiswa,
    //   ...resultPayment,
    //   monthly_type: monthlyPaymentType.map((item) => ({
    //     ...item,
    //     sisa_tagihan: resultMonthly
    //       .filter(
    //         (itemMonthly) =>
    //           item.payment_rate_id === itemMonthly.payment_rate_id && itemMonthly.payment_rate_status == 0
    //       )
    //       .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0),
    //     monthly_payment: resultMonthly
    //       .filter((itemMonthly) => item.payment_rate_id === itemMonthly.payment_rate_id)
    //       .map((item) => ({
    //         ...item,
    //         payment_rate_bill: parseInt(item.payment_rate_bill),
    //       })),
    //   })),
    //   ...freeType,
    // };

    return helpers.response(res, 200, "Get Pembayaran siswa berhasil", resultWithStudent);
  }),

};
