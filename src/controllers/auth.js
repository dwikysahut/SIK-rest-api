/* eslint-disable camelcase */
const generatorPassword = require('generate-password');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const authModel = require('../models/auth');

const refreshTokens = [];

module.exports = {
  login: promiseHandler(async (req, res, next) => {
    const { user_email, user_password } = req.body;
    const checkData = await authModel.getUserByUsername(user_email);
    console.log(checkData);
    if (!checkData) {
      return next(customErrorApi(401, 'Username atau Password Salah'));
    }
    const passwordCompare = bcrypt.compareSync(user_password, checkData.user_password);
    if (!passwordCompare) {
      return next(customErrorApi(401, 'Username atau Password Salah'));
    }
    console.log('this');
    delete checkData.user_password;
    delete checkData.created_at;
    delete checkData.updated_at;
    delete checkData.user_id;
    const token = jwt.sign({ checkData }, process.env.SECRET_KEY);
    const refreshToken = jwt.sign(
      { checkData },
      process.env.REFRESH_TOKEN_SECRET_KEY,
    );
    refreshTokens.push(refreshToken);
    const result = {
      ...checkData,
      token,
      refreshToken,
    };
    console.log(result);
    return helpers.response(res, 200, 'Login Berhasil', result);
  }),
  register: promiseHandler(async (req, res, next) => {
    const {
      user_role_role_id, user_email, user_full_name, user_password,
    } = req.body;

    const checkData = await authModel.getUserByUsername(user_email);
    if (checkData) {
      return next(customErrorApi(401, 'Email telah terdaftar'));
    }
    // const password = generatorPassword.generate({ length: 10, numbers: true });

    const passwordHash = bcrypt.hashSync(user_password, 6);
    const htmlTemplate = `<center><h2>Password : </h2><hr><h4>pass : ${user_password}</h4></center>`;
    const emailSending = await helpers.nodemailer(user_email, 'Password', htmlTemplate);
    console.log(emailSending);

    const result = await authModel.register({
      user_role_role_id,
      user_email,
      user_password: passwordHash,
      user_full_name,
    });

    const newResult = {
      ...result,
    };
    delete newResult.password;

    return helpers.response(res, 200, 'Register Berhasil', result);
  }),
  logout: promiseHandler(async (req, res, next) => {
    console.log(refreshTokens);
    const { token } = req.body;
    const findIndex = refreshTokens.findIndex((item) => item == token);
    if (findIndex == -1) {
      return helpers.response(res, 200, 'Logout Berhasil', {});
    }

    refreshTokens.splice(findIndex, 1);
    console.log(refreshTokens);
    return helpers.response(res, 200, 'Logout Berhasil', {});
  }),

};
