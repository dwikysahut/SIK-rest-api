const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const prodiModel = require('../models/program-studi');

module.exports = {
  getAllProdi: promiseHandler(async (req, res, next) => {
    const result = await prodiModel.getAllProgramStudi();
    return helpers.response(res, 200, 'Get All Prodi Successfully', result);
  }),
  getProdiById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const checkData = await prodiModel.getProdiById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await prodiModel.getProdiById(id);

    return helpers.response(res, 200, 'Get Prodi By ID Successfully', result);
  }),
  postProdi: promiseHandler(async (req, res, next) => {
    const { body } = req;

    const result = await prodiModel.postProgramStudi(body);
    return helpers.response(res, 200, 'POST Prodi Successfully', result);
  }),
  putProdi: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;
    const checkData = await prodiModel.getProdiById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await prodiModel.putProgramStudi(id, body);
    return helpers.response(res, 200, 'PUT Prodi Successfully', result);
  }),
  deleteProdi: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await prodiModel.getProdiById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await prodiModel.deleteProgramStudi(id);
    return helpers.response(res, 200, 'DELETE Prodi Successfully', result);
  }),
};
