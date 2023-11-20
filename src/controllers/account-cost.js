/* eslint-disable camelcase */
const { validationResult } = require('express-validator');
const helpers = require('../helpers');
const { promiseHandler } = require('../middleware/promiseHandler');
const accountCostModel = require('../models/account-cost');

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
      code, account_type, account_description, account_note, account_category, account_majors_id,
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
      sekolah_id: 0, // sekolah
    };
    const result = await accountCostModel.postAccountCostByTypeAndId(setData);

    return helpers.response(res, 201, 'Post Data Account Cost Successfully', result);
  }),
  putAccountCost: promiseHandler(async (req, res, next) => {
    const errors = validationResult(req);
    // if (!errors.isEmpty()) {
    //   return helpers.response(res, 442, 'Put data  Account Cost failed', { errors: errors.array() });
    // }
    const {
      code, , account_description,
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
      sekolah_id: 0, // sekolah
    };
    const result = await accountCostModel.postAccountCostByTypeAndId(setData);

    return helpers.response(res, 200, 'get All Account Cost Successfully', result);
  }),

};
