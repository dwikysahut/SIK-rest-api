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
  getPaymentRateById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await paymentRateModel.getPaymentRateById(id);
    const detailResult = await detailPaymentRateModel.getAllDetailPaymentRateById(id);
    const newResult = {
      ...result,
      months_payment: [...detailResult],
    };
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

};
