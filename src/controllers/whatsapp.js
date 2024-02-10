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
    try {
      for (let i = 0; i < phones_no.length; i++) {
        await axios.post("http://116.203.191.58/api/send_message", {
          phone_no: phones_no[i],
          key,
          message: message,
          skip_link: true,
          deliveryFlag: true,
        });
      }
    } catch (error) {}

    return helpers.response(
      res,
      200,
      "Send Message Successfully",
      response.data
    );
  }),
};
