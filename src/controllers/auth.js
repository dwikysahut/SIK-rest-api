const generatorPassword = require('generate-password');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const helpers = require('../helpers');
const { customErrorApi } = require('../helpers/CustomError');
const { promiseHandler } = require('../middleware/promiseHandler');
const authModel = require('../models/auth');

const refreshTokens = [];
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
      console.log('nyambung');
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
    refreshTokens.push(refreshToken);
    const result = {
      ...checkData,
      token,
      refreshToken,
    };

    return helpers.response(res, 200, 'Login Berhasil', result);
  }),
  register: promiseHandler(async (req, res, next) => {
    const {
      id_role, email, nama,
    } = req.body;

    const checkData = await authModel.getUserByUsername(email);
    if (checkData) {
      return next(customErrorApi(401, 'Email telah terdaftar'));
    }
    const password = generatorPassword.generate({ length: 10, numbers: true });

    const passwordHash = bcrypt.hashSync(password, 6);
    const htmlTemplate = `<center><h2>Password : </h2><hr><h4>pass : ${password}</h4></center>`;
    const emailSending = await helpers.nodemailer(email, 'Password', htmlTemplate);
    console.log(emailSending);

    const result = await authModel.register({
      id_role,
      email,
      password: passwordHash,
      nama,
    });

    const newResult = {
      ...result,
    };
    delete newResult.password;

    return helpers.response(res, 200, 'Register Berhasil', result);
  }),
};