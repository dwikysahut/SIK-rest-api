const moment = require("moment");
const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
const cashAccountModel = require("../models/cash-account");

module.exports = {
  getAllCashAccount: promiseHandler(async (req, res, next) => {
    const { unit_unit_id } = req.query;
    const query =
      unit_unit_id == undefined || unit_unit_id == ""
        ? ""
        : `WHERE unit_unit_id=${unit_unit_id}`;
    const queryFormat = {};

    const result = await cashAccountModel.getAllCashAccount(query);

    return helpers.response(res, 200, "Get All Kas Berhasil", result);
  }),
  putCashAccount: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const { unit_unit_id } = req.body;

    const queryFormat = {};

    const result = await cashAccountModel.getAllCashAccount(query);

    return helpers.response(res, 200, "Get All Alumni Successfully", result);
  }),
};
