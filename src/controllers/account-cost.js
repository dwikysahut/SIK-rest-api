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
  getAllAccountCostPay: promiseHandler(async (req, res, next) => {
    const result = await accountCostModel.getAllAccountCostPosBayar(null);
    return helpers.response(res, 200, 'get All Account Cost Pos Successfully', result);
  }),
  getGenerateCodeAccountCost: promiseHandler(async (req, res, next) => {
    const { account_code, account_type } = req.body;
    // console.log(req.body);
    if (account_type < 3) {
      const query = account_type == 1 ? `${account_code.slice(0, 4)}` : `${account_code.slice(0, 5)}`;
      console.log(query);

      const checkData = await accountCostModel.getAccountCostByTypeAndId(query);
      console.log(checkData);

      const checkDataFilter = account_type == 1 ? checkData.filter((item) => parseInt(item.account_code.split('-')[1], 10) % 100 === 0) : checkData;
      console.log(checkDataFilter);
      const lastNumber = checkDataFilter[checkDataFilter.length - 1]?.account_code || 0;
      const newCode = account_type == 1 ? `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 100}` : `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 1}`;
      return helpers.response(res, 200, 'get  Account Cost Code Successfully', { code: newCode });
    }

    const query = account_code;
    const checkData = await accountCostModel.getAccountCostByTypeAndId(query);

    const lastNumber = checkData[checkData.length - 1].account_code;
    const newCode = lastNumber.split('.')[account_type - 2] ? `${lastNumber}.${parseInt(lastNumber.split('.')[account_type - 2], 10) + 1}` : `${lastNumber}.1`;
    return helpers.response(res, 200, 'get  Account Cost Code Successfully', { code: newCode });
  }),

  postAccountCost: promiseHandler(async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return helpers.response(res, 442, 'Post data failed', { errors: errors.array() });
    }
    const {
      account_code, account_type, account_description, account_note, account_category, account_majors_id, sekolah_id,
    } = req.body;
    console.log(account_type);
    // const query = account_type == 1 ? `${code.slice(0, 4)}` : `${code.slice(0, 5)}`;

    // const checkData = await accountCostModel.getAccountCostByTypeAndId(query);
    // const checkDataFilter = account_type == 1 ? checkData.filter((item) => parseInt(item.account_code.split('-')[1], 10) % 100 === 0) : checkData;
    // console.log(checkDataFilter);
    // const lastNumber = checkDataFilter[checkDataFilter.length - 1].account_code;
    // const newCode = account_type == 1 ? `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 100}` : `${lastNumber.split('-')[0]}-${parseInt(lastNumber.split('-')[1], 10) + 1}`;
    const setData = {
      account_code,
      account_type,
      account_description,
      account_note: account_note || 0,
      account_category: account_category || 0,
      account_majors_id: account_majors_id || 0,
      sekolah_id, // sekolah
    };
    const result = await accountCostModel.postAccountCost(setData);

    return helpers.response(res, 201, 'Post Data Account Cost Successfully', result);
  }),
  putAccountCost: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
      sekolah_id, account_description, account_category,
    } = req.body;

    const checkData = await accountCostModel.getAccountCostById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const setData = {
      account_category,
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

    return helpers.response(res, 200, 'delete Account Cost Successfully', result);
  }),

};
