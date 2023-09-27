const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const kelasModel = require('../models/kelas');

module.exports = {
  getAllKelas: promiseHandler(async (req, res, next) => {
    const result = await kelasModel.getAllKelas();
    return helpers.response(res, 200, 'Get All Kelas Successfully', result);
  }),
  getKelasById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const checkData = await kelasModel.getKelasById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await kelasModel.getProdiById(id);

    return helpers.response(res, 200, 'Get Kelas By ID Successfully', result);
  }),
  getKelasByProdi: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const checkData = await kelasModel.getKelasByProdi(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await kelasModel.getKelasByProdi(id);

    return helpers.response(res, 200, 'Get Kelas By Prodi Successfully', result);
  }),
  postKelas: promiseHandler(async (req, res, next) => {
    const { body } = req;

    const result = await kelasModel.postKelas(body);
    return helpers.response(res, 200, 'POST Kelas Successfully', result);
  }),
  putKelas: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;
    const checkData = await kelasModel.getKelasById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await kelasModel.putKelas(id, body);
    return helpers.response(res, 200, 'PUT Kelas Successfully', result);
  }),
  deleteKelas: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await kelasModel.getKelasById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await kelasModel.deleteKelas(id);
    return helpers.response(res, 200, 'DELETE Kelas Successfully', result);
  }),
};
