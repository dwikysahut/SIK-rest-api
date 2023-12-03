/* eslint-disable camelcase */
const { validationResult } = require('express-validator');
const helpers = require('../helpers');
const { promiseHandler } = require('../middleware/promiseHandler');
const posPayModel = require('../models/pos-pay');
const { customErrorApi } = require('../helpers/CustomError');
const accountCost = require('../models/account-cost');

module.exports = {
  getAllPiutang: promiseHandler(async (req, res, next) => {
    const query = '1-1020';
    const result = await accountCost.getAllAccountCostByAccountCode(query);

    const newResult = result.filter((item) => item.account_type == 2);
    return helpers.response(res, 200, 'get All Piutang Successfully', newResult);
  }),
  postPosPay: promiseHandler(async (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return helpers.response(res, 442, 'Post data failed', { errors: errors.array() });
    }
    const {
      account_account_code, account_account_credit, pos_pay_name, pos_pay_description, sekolah_id,
    } = req.body;
    const setData = {
      account_account_code,
      account_account_credit,
      pos_pay_name,
      pos_pay_description,
      sekolah_id: sekolah_id || 0,
    };
    const result = await posPayModel.postPosPay(setData);

    return helpers.response(res, 201, 'Post Data Pos Pay Successfully', result);
  }),
  putPosPay: promiseHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
      account_account_code,
      account_account_credit,
      pos_pay_name,
      pos_pay_description,
    } = req.body;

    const checkData = await posPayModel.getPosPayById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }
    const setData = {
      account_account_code,
      account_account_credit,
      pos_pay_name,
      pos_pay_description,
      sekolah_id: 0,
    };
    const result = await posPayModel.putPosPay(id, setData);

    return helpers.response(res, 200, 'put Pos Pay Successfully', result);
  }),
  deletePosPay: promiseHandler(async (req, res, next) => {
    const { id } = req.params;

    const checkData = await posPayModel.getPosPayById(id);
    if (!checkData) {
      return next(customErrorApi(404, 'ID Not Found'));
    }

    const result = await posPayModel.deletePosPay(id);

    return helpers.response(res, 200, 'delete Pos Pay Successfully', result);
  }),

};
