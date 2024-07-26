const helpers = require("../helpers");
const moment = require("moment");
const {
  pdfGenerate,
  generateRincianPembayaran,
  generateTagihanPembayaran,
  generateKwitansiPembayaran,
  generateKredit,
  generateDebit,
  generateDokumenLaporanPerKelas,
  generateDokumenLaporanKas,
  generateDokumenJurnalUmum,
  generateDokumenLaporanKasPerAnggaran,
  generateDokumenLaporanJurnalUmumPerAnggaran,
} = require("../middleware/documentService");
const { promiseHandler } = require("../middleware/promiseHandler");
const monthlyPaymentModel = require("../models/monthly-payment");
const freePaymentModel = require("../models/free-payment");
const detailFreePaymentModel = require("../models/detail-free-payment-transaction");
const paymentTransactionModel = require("../models/payment-transaction");
const kreditModel = require("../models/kredit");
const debitModel = require("../models/debit");
const tahunAjaranModel = require("../models/tahun-ajaran");
const studentModel = require("../models/siswa");
const unitModel = require("../models/unit");
const periodModel = require("../models/tahun-ajaran");
const classModel = require("../models/kelas");
const paymentTypeModel = require("../models/payment-type");
const cashAccountModel = require("../models/cash-account");
const { decryptData, encryptData } = require("../utils/encrypt");
const posPayModel = require("../models/pos-pay");
moment.locale('id');

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
    console.log(previousBilling);
    const resultObject = {
      ...dataSiswa,
      ...currentTahunAjaran,
      current_billing: {
        total_bill: currentBilling.reduce(
          (accumulator, currentValue) =>
            accumulator + parseInt(currentValue.payment_rate_bill, 10),
          0
        ),
        bill: currentBilling,
      },
      previous_billing: {
        total_bill: previousBilling.reduce(
          (accumulator, currentValue) =>
            accumulator + parseInt(currentValue.payment_rate_bill, 10),
          0
        ),
        bill: previousBilling,
      },
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
  getDokumenKredit: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const data = await kreditModel.getKreditDokumenById(id);
    const result = await generateKredit(
      "../assets/pdfTemplate/dokumen-kas.html",
      data
    );
    console.log(result);
    return helpers.response(res, 200, "GET dokumen kredit berhasil", result);
  }),
  getDokumenDebit: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const data = await debitModel.getDebitDokumenById(id);
    console.log(data);
    const result = await generateDebit(
      "../assets/pdfTemplate/dokumen-kas.html",
      data
    );
    console.log(result);
    return helpers.response(res, 200, "GET dokumen kredit berhasil", result);
  }),
  getPublicDokumenTagihanPembayaran: promiseHandler(async (req, res, next) => {
    const paramsData = {
      iv: req.query.iv,
      encryptedData: req.query.encryptedData,
    };
    console.log(paramsData);
    const decryptedData = await decryptData(paramsData);
    const id = decryptedData;
    console.log(id);
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
      current_billing: {
        total_bill: currentBilling.reduce(
          (accumulator, currentValue) =>
            accumulator + parseInt(currentValue.payment_rate_bill, 10),
          0
        ),
        bill: currentBilling,
      },
      previous_billing: {
        total_bill: previousBilling.reduce(
          (accumulator, currentValue) =>
            accumulator + parseInt(currentValue.payment_rate_bill, 10),
          0
        ),
        bill: previousBilling,
      },
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

  getKwitansiPembayaran: promiseHandler(async (req, res, next) => {
    const { student_id, no_referensi, period_start, period_end } = req.body;

    const dataSiswa = await studentModel.getSiswaById(student_id);

    const resultFreePayment =
      await freePaymentModel.getDetailFreePaymentTypeByReference(no_referensi);
    const resultMonthlPayment =
      await monthlyPaymentModel.getMonthlyPaymentByReferenceNumber(
        student_id,
        no_referensi
      );
    console.log(resultFreePayment);
    // console.log(resultMonthlPayment);
    ///lanjut sini
    const newFormatResultFree = resultFreePayment.map((item) => ({
      ...item,
      payment_rate_number_pay: item.payment_rate_bebas_pay_number,
    }));

    const allResult = [...resultMonthlPayment, ...newFormatResultFree];

    // const allResult = [...resultMonthly, ...newFormatResultFree].filter(
    //   (item, index, arr) =>
    //     index ===
    //     arr.findIndex(
    //       (t) => item.payment_rate_number_pay == t.payment_rate_number_pay
    //     )
    // );
    // return helpers.response(res, 200, "Sukses", allResult);
    const resultObject = {
      ...dataSiswa,
      tahun_ajaran: `${period_start}/${period_end}`,
      payment: [...allResult],
      no_ref: no_referensi,
      total: allResult.reduce(
        (accumulator, currentValue) =>
          accumulator +
          parseInt(
            currentValue.payment_rate_bebas_pay_bill
              ? currentValue.payment_rate_bebas_pay_bill
              : currentValue.payment_rate_bill,
            10
          ),
        0
      ),
    };

    const result = await generateKwitansiPembayaran(
      "../assets/pdfTemplate/dokumen-kwitansi.html",
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
  getPublicDokumenBuktiPembayaran: promiseHandler(async (req, res, next) => {
    const paramsData = {
      iv: req.query.iv,
      encryptedData: req.query.encryptedData,
    };
    const decryptedData = await decryptData(paramsData);
    const { student_id, no_referensi, period_start, period_end } =
      JSON.parse(decryptedData);
    console.log(decryptedData);
    const dataSiswa = await studentModel.getSiswaById(student_id);

    const resultFreePayment =
      await freePaymentModel.getDetailFreePaymentTypeByReference(no_referensi);
    const resultMonthlPayment =
      await monthlyPaymentModel.getMonthlyPaymentByReferenceNumber(
        student_id,
        no_referensi
      );
    ///lanjut sini
    const newFormatResultFree = resultFreePayment.map((item) => ({
      ...item,
      payment_rate_number_pay: item.payment_rate_bebas_pay_number,
    }));

    const allResult = [...resultMonthlPayment, ...newFormatResultFree];

    // const allResult = [...resultMonthly, ...newFormatResultFree].filter(
    //   (item, index, arr) =>
    //     index ===
    //     arr.findIndex(
    //       (t) => item.payment_rate_number_pay == t.payment_rate_number_pay
    //     )
    // );
    // return helpers.response(res, 200, "Sukses", allResult);
    const resultObject = {
      ...dataSiswa,
      tahun_ajaran: `${period_start}/${period_end}`,
      payment: [...allResult],
      no_ref: no_referensi,
      total: allResult.reduce(
        (accumulator, currentValue) =>
          accumulator +
          parseInt(
            currentValue.payment_rate_bebas_pay_bill
              ? currentValue.payment_rate_bebas_pay_bill
              : currentValue.payment_rate_bill,
            10
          ),
        0
      ),
    };

    const result = await generateKwitansiPembayaran(
      "../assets/pdfTemplate/dokumen-kwitansi.html",
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

  //dokumen laporan
  dokumenlaporanPembayaranPerKelas: promiseHandler(async (req, res, next) => {
    const { unit_id, class_id, period_id, payment_type } = req.query;
    const posPayType = await posPayModel.getPosPayById(payment_type)
    const periodResult = await tahunAjaranModel.getTahunAjaranById(period_id)
    const unitResult = await unitModel.getUnitById(unit_id)
    let classResult = null;
    if (class_id !== '')
      classResult = await classModel.getKelasById(class_id)
    const queryFormat = {};
    console.log(class_id);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    const queryToString = helpers.queryToString(queryFormat);

    const resultSiswa = await studentModel.getAllSiswa(queryToString);
    console.log(queryFormat)
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

    // const total = [...resultFree, ...resultMonthly].reduce(
    //   (accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10),
    //   0
    // );
    const newResult = {
      tahun_ajaran: `${periodResult.period_start}/${periodResult.period_end}`,
      title: `Laporan Pembayaran ${posPayType.pos_pay_name} ${unitResult.unit_name}`,
      class: classResult?.class_name ?? 'Semua',
      students: resultSiswa.map((student) => ({
        ...student,
        total_tagihan:
          (parseInt(resultFree.filter((item) => item.student_id == student.student_id)[0]?.payment_rate_bill, 10) || 0) +
          (resultMonthly
            .filter((item) => item.student_id == student.student_id)
            .reduce((accumulator, currentValue) => accumulator + parseInt(currentValue.payment_rate_bill, 10), 0) || 0),
        result_free: (parseInt(resultFree.filter((item) => item.student_student_id == student.student_id)[0]?.payment_rate_bill, 10) || 0),
        result_month: resultMonthly
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
      }))
    };
    const result = await generateDokumenLaporanPerKelas(
      "../assets/pdfTemplate/laporan/pembayaran-per-kelas.html",
      newResult
    );
    return helpers.response(res, 200, "GET Data Laporan pembayaran per kelas berhasil", result);
  }),
  dokumenlaporanPembayaranPerTanggal: promiseHandler(async (req, res, next) => {
    const { unit_id, class_id, period_id, payment_type, tanggal_awal, tanggal_akhir } = req.query;
    const queryFormat = {};
    // untuk penyesuaian query di sql
    const posPayType = await posPayModel.getPosPayById(payment_type)
    const periodResult = await tahunAjaranModel.getTahunAjaranById(period_id)
    const unitResult = await unitModel.getUnitById(unit_id)
    let classResult = null;
    if (class_id !== '')
      classResult = await classModel.getKelasById(class_id)
    queryFormat.class_class_id = class_id == "" || class_id == undefined ? "" : class_id;
    queryFormat.unit_unit_id = unit_id == "" || unit_id == undefined ? "" : unit_id;
    // const queryToString = helpers.queryToString(queryFormat);

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

    const newResultPayment = {
      tahun_ajaran: `${periodResult.period_start}/${periodResult.period_end}`,
      title: `Laporan Pembayaran Tanggal ${tanggal_awal} s/d ${tanggal_akhir} `,
      class: classResult?.class_name ?? 'Semua',
      tanggal_akhir,
      tanggal_awal,
      payment_type: resultPaymentType.map(item => ({
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
    }
    const result = await generateDokumenLaporanPerKelas(
      "../assets/pdfTemplate/laporan/pembayaran-per-tanggal.html",
      newResultPayment
    );
    return helpers.response(res, 200, "GET Data Laporan pembayaran per kelas berhasil", result);
  }),
  dokumenLaporanKasBank: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;


    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '1-10102', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '1-10102', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '1-10102', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '1-10102', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)
    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan (Kas Bank) per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }

    const result = await generateDokumenLaporanKas(
      "../assets/pdfTemplate/laporan/laporan-kas.html",
      newResult,
    );
    return helpers.response(res, 200, "GET Dokumen kas bank berhasil", result);
  }),
  dokumenLaporanKasTunai: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;


    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '1-10101', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '1-10101', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '1-10101', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '1-10101', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});
    console.log(reducedArr)
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )
    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)
    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan (Kas Tunai) per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }

    const result = await generateDokumenLaporanKas(
      "../assets/pdfTemplate/laporan/laporan-kas.html",
      newResult,
    );
    return helpers.response(res, 200, "GET Laporan kas tunai berhasil", result);
  }),
  dokumenLaporanJurnalUmum: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;


    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});
    console.log(reducedArr)
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )
    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)
    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan Jurnal per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }

    const result = await generateDokumenJurnalUmum(
      "../assets/pdfTemplate/laporan/laporan-jurnal-umum.html",
      newResult,
    );
    return helpers.response(res, 200, "GET Dokumen Jurnal Umum berhasil", result);
  }),

  dokumenLaporanKasBankPerAnggaran: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;

    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '1-10102', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '1-10102', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '1-10102', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '1-10102', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '1-10102', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) || 0 : acc[cur.account_code] = cur;
      return acc;
    }, {});
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)

    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan per Jenis Anggaran (Kas Bank) per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }
    const accountCodeArr = helpers.extractUniqueAccountCodes(newResult)
    console.log(accountCodeArr)
    const newResultByAccountCode = accountCodeArr.map(item => {
      const dataFilteredDebit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code.includes('4-4') || itemFilter.account_code.includes('4-4')))
      const dataFilteredKredit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code.includes('5-5') || itemFilter.account_code.includes('5-5')))
      return {
        code: item,
        description: resultCashAccount.filter(itemAccount => itemAccount.account_code == item)[0].account_description,
        data_payment: {
          debit: {
            data: dataFilteredDebit,
            sub_total_masuk: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
          kredit: {
            data: dataFilteredKredit,
            sub_total_masuk: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
        },
        total: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total || 0, 10),
          0
        ),
        total_keluar: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total_keluar || 0, 10),
          0
        ),
      }
    })
    const result = await generateDokumenLaporanKasPerAnggaran(
      "../assets/pdfTemplate/laporan/laporan-kas-per-anggaran.html", newResult,
      newResultByAccountCode,
    );
    return helpers.response(res, 200, "GET Dokumen kas bank berhasil", result);
  }),
  dokumenLaporanKasTunaiPerAnggaran: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;

    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '1-10101', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '1-10101', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '1-10101', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '1-10101', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '1-10101', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) || 0 : acc[cur.account_code] = cur;
      return acc;
    }, {});
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)

    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan per Jenis Anggaran (Kas Bank) per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }
    const accountCodeArr = helpers.extractUniqueAccountCodes(newResult)
    console.log(accountCodeArr)
    const newResultByAccountCode = accountCodeArr.map(item => {
      const dataFilteredDebit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code.includes('4-4') || itemFilter.account_code.includes('4-4')))
      const dataFilteredKredit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code.includes('5-5') || itemFilter.account_code.includes('5-5')))
      return {
        code: item,
        description: resultCashAccount.filter(itemAccount => itemAccount.account_code == item)[0].account_description,
        data_payment: {
          debit: {
            data: dataFilteredDebit,
            sub_total_masuk: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
          kredit: {
            data: dataFilteredKredit,
            sub_total_masuk: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
        },
        total: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total || 0, 10),
          0
        ),
        total_keluar: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total_keluar || 0, 10),
          0
        ),
      }
    })
    const result = await generateDokumenLaporanKasPerAnggaran(
      "../assets/pdfTemplate/laporan/laporan-kas-per-anggaran.html", newResult,
      newResultByAccountCode,
    );
    return helpers.response(res, 200, "GET Dokumen Per anggaran kas tunai berhasil", result);
  }),
  dokumenLaporanJurnalPerAnggaran: promiseHandler(async (req, res, next) => {
    const { tanggal_awal, tanggal_akhir, period_id, unit_id } = req.query;

    //semua data sampai sebelum tanggal_akhir
    const resultMonthlyPrev = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(true, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFreePrev = await freePaymentModel.getKasFreePaymentIdPayment(true, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKreditPrev = await kreditModel.getAllKreditSubmittedWithDate(true, '', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebitPrev = await debitModel.getAllDebitSubmittedWithDate(true, '', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArrPrev = [...resultKreditPrev, ...resultDebitPrev].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total || 0, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) : acc[cur.account_code] = cur;
      return acc;
    }, {});

    const queryPrev =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccountPrev = await cashAccountModel.getAllCashAccount(queryPrev);
    const newResultCashAccountPrev = {
      saldo_awal_debit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_debit, 10),
        0
      ),
      saldo_awal_kredit: resultCashAccountPrev.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResultPrev = [...resultMonthlyPrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFreePrev.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArrPrev).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasukPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluarPrev = combinedResultPrev.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    console.log(resultMonthlyPrev)
    const saldoAkhirPrev = (subTotalMasukPrev + newResultCashAccountPrev.saldo_awal_debit) - (subTotalKeluarPrev + newResultCashAccountPrev.saldo_awal_kredit)

    //baru

    const resultMonthly = await monthlyPaymentModel.getKasMonthlyPaymentAllStudent(false, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultFree = await freePaymentModel.getKasFreePaymentIdPayment(false, '', tanggal_awal, tanggal_akhir, period_id, unit_id);
    const resultKredit = await kreditModel.getAllKreditSubmittedWithDate(false, '', tanggal_awal, tanggal_akhir, unit_id);
    const resultDebit = await debitModel.getAllDebitSubmittedWithDate(false, '', tanggal_awal, tanggal_akhir, unit_id);

    const reducedArr = [...resultKredit, ...resultDebit].reduce((acc, cur) => {
      acc[cur.account_code] ? acc[cur.account_code].total = parseInt(acc[cur.account_code].total, 10) + parseInt(cur.total || 0, 10) : acc[cur.account_code] = cur;
      acc[cur.account_code] ? acc[cur.account_code].total_keluar = (parseInt(acc[cur.account_code].total_keluar || 0, 10) + parseInt(cur.total_keluar || 0, 10)) || 0 : acc[cur.account_code] = cur;
      return acc;
    }, {});
    const query =
      unit_id == undefined || unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_id}`;
    const resultCashAccount = await cashAccountModel.getAllCashAccount(query);
    const newResultCashAccount = {
      // saldo_awal_debit: resultCashAccount.reduce(
      //   (accumulator, currentValue) =>
      //     accumulator + parseInt(currentValue.cash_account_debit, 10),
      //   0
      // ),

      // pakai sebelumnya
      saldo_awal_debit: parseInt(saldoAkhirPrev || 0, 10) || 0,
      saldo_awal_kredit: resultCashAccount.reduce(
        (accumulator, currentValue) =>
          accumulator + parseInt(currentValue.cash_account_kredit, 10),
        0
      ),
    };
    const combinedResult = [...resultMonthly.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...resultFree.map(item => ({ ...item, date_pay: item.payment_rate_date_pay })), ...Object.values(reducedArr).map(item => ({ ...item, date_pay: item.kredit_date }))];
    const subTotalMasuk = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total || 0, 10),
      0
    )
    const subTotalKeluar = combinedResult.reduce(
      (accumulator, currentValue) =>
        accumulator + parseInt(currentValue.total_keluar || 0, 10),
      0
    )

    const resultUnit = await unitModel.getUnitById(unit_id)
    const resultPeriod = await periodModel.getTahunAjaranById(period_id)

    const newResult = { unit: unit_id == '' ? 'Semua' : resultUnit.unit_name, tahun_ajaran: `${resultPeriod.period_start}/${resultPeriod.period_end}`, title: `Rekap Laporan per Jenis Anggaran (Jurnal Umum) per Tanggal ${moment(tanggal_awal).format('DD MMMM YYYY')} Sampai ${moment(tanggal_akhir).format('DD MMMM YYYY')}`, data_payment: combinedResult, sub_total_masuk: subTotalMasuk, sub_total_keluar: subTotalKeluar, ...newResultCashAccount, total_masuk: subTotalMasuk + newResultCashAccount.saldo_awal_debit, total_keluar: subTotalKeluar + newResultCashAccount.saldo_awal_kredit, saldo_akhir: (subTotalMasuk + newResultCashAccount.saldo_awal_debit) - (subTotalKeluar + newResultCashAccount.saldo_awal_kredit) }
    const accountCodeArr = helpers.extractUniqueAccountCodes(newResult)
    console.log(accountCodeArr)
    const newResultByAccountCode = accountCodeArr.map(item => {
      const dataFilteredDebit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code?.includes('4-4') || itemFilter.account_code?.includes('4-4')))
      const dataFilteredKredit = newResult.data_payment.filter(itemFilter => itemFilter.account_code == item && (itemFilter.account_cost_account_code?.includes('5-5') || itemFilter.account_code?.includes('5-5')))
      return {
        code: item,
        description: resultCashAccount.filter(itemAccount => itemAccount?.account_code == item)[0]?.account_description,
        data_payment: {
          debit: {
            data: dataFilteredDebit,
            sub_total_masuk: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredDebit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
          kredit: {
            data: dataFilteredKredit,
            sub_total_masuk: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total || 0, 10),
              0
            ),
            sub_total_keluar: dataFilteredKredit.reduce(
              (accumulator, currentValue) =>
                accumulator + parseInt(currentValue.total_keluar || 0, 10),
              0
            ),
          },
        },
        total: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total || 0, 10),
          0
        ),
        total_keluar: newResult.data_payment.filter(itemFilter => itemFilter.account_code == item)?.reduce(
          (accumulator, currentValue) =>
            accumulator + parseFloat(currentValue.total_keluar || 0, 10),
          0
        ),
      }
    })
    const result = await generateDokumenLaporanJurnalUmumPerAnggaran(
      "../assets/pdfTemplate/laporan/laporan-jurnal-umum-per-anggaran.html", newResult,
      newResultByAccountCode,
    );
    return helpers.response(res, 200, "GET Dokumen Per anggaran kas tunai berhasil", result);
  }),
};
