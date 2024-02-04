const moment = require("moment");
const helpers = require("../helpers");
const { customErrorApi } = require("../helpers/CustomError");
const { promiseHandler } = require("../middleware/promiseHandler");
require("dotenv").config();

const axios = require("axios");
const alumniModel = require("../models/alumni");

module.exports = {
  postMessage: promiseHandler(async (req, res, next) => {
    const { message, phones_no } = req.body;
    const key = "97465483a3ad95e13814f908d141bfefdfe04b0b63518751";
    const response = await axios.post(
      "http://116.203.191.58/api/send_message",
      {
        phone_no: "082234632343",
        key,
        message: "halo mas yoga, ini tes",
        skip_link: true,
        deliveryFlag: true,
      }
    );
    return helpers.response(
      res,
      200,
      "Send Message Successfully",
      response.data
    );
  }),
};
