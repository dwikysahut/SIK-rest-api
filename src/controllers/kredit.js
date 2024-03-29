const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
const kreditModel = require("../models/kredit");

module.exports = {
  getAllKredit: promiseHandler(async (req, res, next) => {
    const { unit_unit_id } = req.query || "";
    const query =
      unit_unit_id == undefined || unit_unit_id == ""
        ? ""
        : `where unit_unit_id=${unit_unit_id}`;

    const result = await kelasModel.getAllKelas(query);
    return helpers.response(res, 200, "Get All Kelas Successfully", result);
  }),
  getKelasById: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await kelasModel.getKelasById(id);
    if (!result) {
      return next(customErrorApi(404, "ID Not Found"));
    }

    return helpers.response(res, 200, "Get Kelas By ID Successfully", result);
  }),
  getKelasByProdi: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const result = await kelasModel.getKelasByProdi(id);
    if (!result) {
      return next(customErrorApi(404, "ID Not Found"));
    }

    return helpers.response(
      res,
      200,
      "Get Kelas By Prodi Successfully",
      result
    );
  }),
  postKredit: promiseHandler(async (req, res, next) => {
    const {
      kredit_date,
      kredit_no_ref,
      kredit_desc,
      kredit_value,
      account_cash_account,
      account_cost_account,
      kredit_tax,
      kredit_information,
      unit_unit_id,
    } = req.body;

    const { token } = req;

    const formBody = {
      kredit_date,
      kredit_no_ref,
      kredit_desc,
      kredit_value,
      account_cash_account,
      account_cost_account,
      kredit_tax,
      kredit_information,
      unit_unit_id,
      is_submit: 0,
      user_user_id: token.user_id ?? null,
    };

    const result = await kreditModel.postKredit(formBody);
    return helpers.response(
      res,
      200,
      "Data Kredit Berhasil Ditambahkan",
      result
    );
  }),
  putKredit: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
      account_cost_account,
      kredit_information,
      kredit_value,
      kredit_tax,
    } = req;
    const checkData = await kreditModel.getKreditById(id);
    if (!checkData) {
      return next(customErrorApi(404, "ID Not Found"));
    }
    const formData = {
      account_cost_account,
      kredit_information,
      kredit_value,
      kredit_tax,
    };
    const result = await kreditModel.putKredit(id, formData);
    return helpers.response(res, 200, "Data Kredit Berhasil Diubah", result);
  }),
  deleteKredit: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await kreditModel.getKreditById(id);
    if (!checkData) {
      return next(customErrorApi(404, "ID Not Found"));
    }
    const result = await kreditModel.deleteKredit(id);
    return helpers.response(res, 200, "Data Kredit Berhasil Dihapus", result);
  }),
};
