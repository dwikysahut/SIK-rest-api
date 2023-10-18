const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const siswaModel = require('../models/siswa');

module.exports = {
  // getAllSiswa: promiseHandler(async (req, res, next) => {
  //   let result;
  //   const { status } = req.query;
  //   if (status) {
  //     result = await siswaModel.getAllSiswaByStatus(status);
  //   } else {
  //     result = await siswaModel.getAllSiswa();
  //   }
  //   return helpers.response(res, 200, 'Get All Siswa Successfully', result);
  // }),
  getAllSiswa: promiseHandler(async (req, res, next) => {
    const { query } = req;
    const queryFormat = {};
    console.log(query);
    // untuk penyesuaian query di sql
    queryFormat.class_class_id = query.class_id == '' || query.class_id == undefined ? '' : query.class_id;
    queryFormat.student_status = query.status == '' || query.status == undefined ? '' : query.status;
    queryFormat.majors_majors_id = query.majors_id == '' || query.majors_id == undefined ? '' : query.majors_id;
    console.log(queryFormat);

    const queryToString = helpers.queryToString(queryFormat);
    console.log(queryToString);
    console.log(queryToString);

    const result = await siswaModel.getAllSiswa(queryToString);

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
    return helpers.response(res, 200, 'Data Siswa Berhasil Ditambahkan', result);
  }),
  putSiswa: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { body } = req;
    const checkData = await siswaModel.getSiswaById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await siswaModel.putKelas(id, body);
    return helpers.response(res, 200, 'Data Siswa Berhasil Diubah', result);
  }),
  deleteSiswa: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await siswaModel.getSiswaById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const result = await siswaModel.deletSiswa(id);
    return helpers.response(res, 200, 'Data Siswa Berhasil Dihapus', result);
  }),
};