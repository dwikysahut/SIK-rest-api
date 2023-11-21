/* eslint-disable camelcase */
const { validationResult } = require('express-validator');
const helpers = require('../helpers');
const { promiseHandler } = require('../middleware/promiseHandler');
const accountCostModel = require('../models/account-cost');
const { customErrorApi } = require('../helpers/CustomError');

module.exports = {
  getAllAccountCost: promiseHandler(async (req, res, next) => {
    const result = await accountCostModel.getAllAccountCost();
    return helpers.response(res, 200, 'get All Account Cost Successfully', result);
  }),
  postAccountCost: promiseHandler(async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return helpers.response(res, 442, 'Post data failed', { errors: errors.array() });
    }
    const {
      code, account_type, account_description, account_note, account_category, account_majors_id, sekolah_id,
    } = req.body;
    const query = account_type == 1 ? `${code.slice(0, 4)}` : `${code.slice(0, 5)}`;

    const checkData = await accountCostModel.getAccountCostByTypeAndId(query);
    const checkDataFilter = account_type == 1 ? checkData.filter((item) => parseInt(item.account_code.split('-')[1], 10) % 100 === 0) : checkData;
    console.log(checkDataFilter);
    const lastNumber = checkDataFilter[checkDataFilter.length - 1].account_code;
    const newCode = account_type == 1 ? `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 100}` : `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 1}`;
    const setData = {
      account_code: newCode,
      account_type,
      account_description,
      account_note,
      account_category,
      account_majors_id,
      sekolah_id, // sekolah
    };
    const result = await accountCostModel.postAccountCost(setData);

    return helpers.response(res, 201, 'Post Data Account Cost Successfully', result);
  }),
  putAccountCost: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
      sekolah_id, account_description,
    } = req.body;

    const checkData = await accountCostModel.getAccountCostByTypeAndId(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const setData = {

      account_description,
      sekolah_id, // sekolah
    };
    const result = await accountCostModel.putAccountCost(id, setData);

    return helpers.response(res, 200, 'put Account Cost Successfully', result);
  }),
  deleteAccountCost: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await accountCostModel.getAccountCostByTypeAndId(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }

    const result = await accountCostModel.deleteAccountCost(id);

    return helpers.response(res, 200, 'put Account Cost Successfully', result);
  }),

};
