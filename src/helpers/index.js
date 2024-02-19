const nodemailer = require("nodemailer");

module.exports = {
  response: (response, status, message, data = {}) => {
    const result = {
      status: status || 200,
      message,
      data,
    };
    return response.status(result.status).json(result);
  },
  nodemailer: (email, subject, template) => {
    const transporter = nodemailer.createTransport({
      service: process.env.SERVICE_MAILER,
      auth: {
        user: process.env.SERVICE_EMAIL,
        pass: process.env.SERVICE_EMAIL_GENERATE_PASSWORD,
      },
    });
    const mailOptions = {
      from: process.env.SERVICE_EMAIL,
      to: email,
      subject,
      html: template,
    };
    return transporter.sendMail(mailOptions, (err, info) => {
      if (err) {
        console.log("salah");
        console.log(err);
        return false;
      }

      console.log(`email sent ${info.response}`);
      return true;
    });
  },
  queryToString: (query) => {
    let result = "";
    for (const key in query) {
      if (query[key] == undefined || query[key] === "") {
        continue;
      }
      result += `${key} LIKE'${query[key] || ""}' AND `;
    }

    const filter = result.replace(/AND\s$/g, "");
    return filter;
  },

  dateConvert: (data) => {
    const date = new Date(data);
    return `${date.getDate()} ${date.toLocaleString("id", {
      month: "long",
    })} ${date.getFullYear()}`;
  },
  rupiahConvert: (data) => {
    return `${data.toLocaleString("id-ID", {
      style: "currency",
      currency: "IDR",
    })}`;
  },
};
