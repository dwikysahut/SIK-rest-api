const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const siswaModel = require('../models/siswa');

module.exports = {
  getAllSiswa: promiseHandler(async (req, res, next) => {
    let result;
    const { status } = req.query;
    if (status) {
      result = await siswaModel.getAllSiswaByStatus(status);
    } else {
      result = await siswaModel.getAllSiswa();
    }
    return helpers.response(res, 200, 'Get All Siswa Successfully', result);
  }),
  getSiswaById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await siswaModel.getSiswaById(id);
    if (!result) {
      return next(customErrorApi(404, 'ID Not Found'));
    }

    return helpers.response(res, 200, 'Get Siswa By ID Successfully', result);
  }),
  getAllSiswaByStatus: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await siswaModel.getAllSiswaByStatus(id);
    if (!result) {
      return next(customErrorApi(404, 'ID Not Found'));
    }

    return helpers.response(res, 200, 'Get Siswa By Prodi Successfully', result);
  }),
  postSiswa: promiseHandler(async (req, res, next) => {
    const { body } = req;

    const result = await siswaModel.postSiswa(body);
    return helpers.response(res, 200, 'POST Siswa Successfully', result);
  }),
  putSiswa: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;
    const checkData = await siswaModel.getSiswaById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await siswaModel.putKelas(id, body);
    return helpers.response(res, 200, 'PUT Siswa Successfully', result);
  }),
  deleteSiswa: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await siswaModel.getSiswaById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await siswaModel.deletSiswa(id);
    return helpers.response(res, 200, 'DELETE Siswa Successfully', result);
  }),
};
