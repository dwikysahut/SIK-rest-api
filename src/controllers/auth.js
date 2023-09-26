const generatorPassword = require('generate-password');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const authModel = require('../models/auth');

module.exports = {
  login: promiseHandler(async (req, res, next) => {
    const { email, password } = req.body;
    const checkData = await authModel.getUserByUsername(email);
    console.log(checkData);
    if (!checkData) {
      return next(customErrorApi(404, 'Username atau Password Salah'));
    }
    const passwordCompare = bcrypt.compareSync(password, checkData.password);
    if (!passwordCompare) {
      return next(customErrorApi(404, 'Username atau Password Salah'));
    }
    delete checkData.password;
    delete checkData.created_at;
    delete checkData.updated_at;
    delete checkData.id_user;
    const token = jwt.sign({ checkData }, process.env.SECRET_KEY);
    const refreshToken = jwt.sign(
      { checkData },
      process.env.REFRESH_TOKEN_SECRET_KEY,
    );
    const result = {
      ...checkData,
      token,
      refreshToken,
    };

    return helpers.response(res, 200, 'Login Berhasil', result);
  }),
  register: promiseHandler(async (req, res, next) => {
    const {
      id_role, email, password, nama,
    } = req.body;

    const checkData = await authModel.getUserByUsername(email);
    if (checkData) {
      return next(customErrorApi(401, 'Email telah terdaftar'));
    }

    const passwordHash = bcrypt.hashSync(password, 6);
    const result = await authModel.register({
      id_role,
      email,
      password: passwordHash,
      nama,
    });

    return helpers.response(res, 200, 'Register Berhasil', result);
  }),
};
