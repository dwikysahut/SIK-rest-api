/* eslint-disable no-plusplus */
/* eslint-disable no-await-in-loop */
/* eslint-disable no-restricted-syntax */
/* eslint-disable guard-for-in */
/* eslint-disable camelcase */
const helpers = require('../helpers');
const { promiseHandler } = require('../middleware/promiseHandler');
const paymentRateModel = require('../models/payment-rate');
const studentModel = require('../models/siswa');
const detailPaymentRateModel = require('../models/detail-payment-rate');
const { customErrorApi } = require('../helpers/CustomError');
const { monthArray } = require('../utils/constant');

module.exports = {

  getAllPaymentRateByPayment: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { class_id: class_class_id, period } = req.query;
    const period_start = period.split('/')[0] ?? '';
    const period_end = period.split('/')[1] ?? '';
    const query = `where (period_start like '%${period_start}%' and period_end like '%${period_end}%') and (class_class_id like '%${class_class_id}%') and payment_payment_id=${id}`;

    const result = await paymentRateModel.getAllPaymentRateByPayment(query);
    return helpers.response(res, 200, 'get All Payment Rate By Payment Successfully', result);
  }),
  // kerjakan
  getAllDetailPaymentRateById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { type = '' } = req.query;

    let newResult;
    if (type.includes('bulanan')) {
      const detailResult = await detailPaymentRateModel.getAllDetailMonthlyPaymentRateById(id);
      if (!detailResult) {
        return next(customErrorApi(404, 'Data Not Found'));
      }
      newResult = {
        ...detailResult,
        months_payment: [...detailResult],
      };
    } else if (type.includes('bebas')) {
      const detailResult = await detailPaymentRateModel.getAllDetailFreePaymentRateById(id);
      if (!detailResult) {
        return next(customErrorApi(404, 'Data Not Found'));
      }
      newResult = {
        ...detailResult,
        months_payment: [...detailResult].map((item, index) => (item.month_month_id == monthArray[index + 1] ? { ...item, [`month_${item.month_month_name.toLowerCase()}`]: { id: item.month_month_id, payment: item.payment_rate_bill } } : { ...item })),
      };
    }

    return helpers.response(res, 200, 'get Detail Payment Rate By ID Successfully', newResult);
  }),
  postMonthlyPaymentRateByClass: promiseHandler(async (req, res, next) => {
    const {
      class_class_id, payment_payment_id, month, type,
    } = req.body;
    if (type.includes('bulanan')) {
      const queryMonth = 'INSERT INTO detail_payment_rate_bulan (payment_rate_id,month_month_id,payment_rate_bill) VALUES ?';

      const allStudentByClass = await studentModel.getAllSiswaByClass(class_class_id);
      let valuesArr = [];

      for (let i = 0; i < allStudentByClass.length; i++) {
        const formDataAddPaymentRate = {
          payment_payment_id,
          student_student_id: allStudentByClass[i].student_id,
        };
        const resultAddData = await paymentRateModel.postPaymentRate(formDataAddPaymentRate);
        console.log(resultAddData);
        for (const key in month) {
          const values = [resultAddData.payment_rate_id, month[key].id, month[key].payment];
          valuesArr.push(values);
        }

        await detailPaymentRateModel.postDetailPaymentRate([valuesArr], queryMonth);
        valuesArr = [];
      }

      // const result = await paymentRateModel.getPaymentRateById(id);
      return helpers.response(res, 200, 'Tambah Tarif Tagihan bulanan Berhasil', allStudentByClass);
    }

    return helpers.response(res, 404, 'Tambah Tarif Tagihan bulanan Gagal', {});
  }),
  postMonthlyPaymentRateByStudent: promiseHandler(async (req, res, next) => {
    const {
      payment_payment_id, month, student_student_id, type,
    } = req.body;
    if (type.includes('bulanan')) {
      const queryMonth = 'INSERT INTO detail_payment_rate_bulan (payment_rate_id,month_month_id,payment_rate_bill) VALUES ?';

      const valuesArr = [];
      const formDataAddPaymentRate = {
        payment_payment_id,
        student_student_id,
      };
      const resultAddData = await paymentRateModel.postPaymentRate(formDataAddPaymentRate);

      for (const key in month) {
        const values = [resultAddData.payment_rate_id, month[key].id, month[key].payment];
        valuesArr.push(values);
      }
      await detailPaymentRateModel.postDetailPaymentRate([valuesArr], queryMonth);

      // const result = await paymentRateModel.getPaymentRateById(id);
      return helpers.response(res, 200, 'Tambah Tarif Tagihan Berhasil', resultAddData);
    }

    return helpers.response(res, 404, 'Tambah Tarif Tagihan bulanan Gagal', {});
  }),
  postFreePaymentRateByClass: promiseHandler(async (req, res, next) => {
    const {
      class_class_id, payment_payment_id, payment, type,
    } = req.body;
    console.log(req.body);
    if (type.includes('bebas')) {
      const queryFree = 'INSERT INTO detail_payment_rate_bebas (payment_rate_id,payment_rate_bill) VALUES ?';

      const allStudentByClass = await studentModel.getAllSiswaByClass(class_class_id);
      let valuesArr = [];

      for (let i = 0; i < allStudentByClass.length; i++) {
        const formDataAddPaymentRate = {
          payment_payment_id,
          student_student_id: allStudentByClass[i].student_id,
        };
        const resultAddData = await paymentRateModel.postPaymentRate(formDataAddPaymentRate);
        console.log(resultAddData);

        const values = [resultAddData.payment_rate_id, payment];
        valuesArr.push(values);

        await detailPaymentRateModel.postDetailPaymentRate([valuesArr], queryFree);
        valuesArr = [];
      }

      // const result = await paymentRateModel.getPaymentRateById(id);
      return helpers.response(res, 200, 'Tambah Tarif Tagihan Bebas Berhasil', allStudentByClass);
    }

    return helpers.response(res, 404, 'Tambah Tarif Tagihan Bebas Gagal', {});
  }),
  postFreePaymentRateByStudent: promiseHandler(async (req, res, next) => {
    const {
      student_student_id, payment_payment_id, payment, type,
    } = req.body;
    console.log(req.body);
    if (type.includes('bebas')) {
      const queryFree = 'INSERT INTO detail_payment_rate_bebas (payment_rate_id,payment_rate_bill) VALUES ?';
      const valuesArr = [];

      const formDataAddPaymentRate = {
        payment_payment_id,
        student_student_id,
      };
      const resultAddData = await paymentRateModel.postPaymentRate(formDataAddPaymentRate);
      console.log(resultAddData);

      const values = [resultAddData.payment_rate_id, payment];
      valuesArr.push(values);

      await detailPaymentRateModel.postDetailPaymentRate([valuesArr], queryFree);

      // const result = await paymentRateModel.getPaymentRateById(id);
      return helpers.response(res, 200, 'Tambah Tarif Tagihan Bebas Berhasil', resultAddData);
    }

    return helpers.response(res, 404, 'Tambah Tarif Tagihan Bebas Gagal', {});
  }),
  deletePaymentRate: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    console.log(id);

    const checkData = await paymentRateModel.getPaymentRateById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await paymentRateModel.deletePaymentRate(id);
    return helpers.response(res, 200, 'Data Tarif Tagihan Berhasil Dihapus', result);
  }),
};
