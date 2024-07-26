const nodemailer = require("nodemailer");
const mysqldump = require("mysqldump");
// or const mysqldump = require('mysqldump')
const path = require("path");
const fs = require("fs");
const { exec } = require("child_process");
require("dotenv").config();

// dump the result straight to a file
const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  host: process.env.DB_HOST,
  port: process.env.DB_PORT, // default MySQL port
};
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
  terbilang_rupiah: (nilai) => {
    nilai = Math.floor(Math.abs(nilai));

    var simpanNilaiBagi = 0;
    var huruf = [
      "",
      "Satu",
      "Dua",
      "Tiga",
      "Empat",
      "Lima",
      "Enam",
      "Tujuh",
      "Delapan",
      "Sembilan",
      "Sepuluh",
      "Sebelas",
    ];
    var temp = "";

    if (nilai < 12) {
      temp = " " + huruf[nilai];
    } else if (nilai < 20) {
      temp = module.exports.terbilang_rupiah(Math.floor(nilai - 10)) + " Belas";
    } else if (nilai < 100) {
      simpanNilaiBagi = Math.floor(nilai / 10);
      temp =
        module.exports.terbilang_rupiah(simpanNilaiBagi) +
        " Puluh" +
        module.exports.terbilang_rupiah(nilai % 10);
    } else if (nilai < 200) {
      temp = " Seratus" + module.exports.terbilang_rupiah(nilai - 100);
    } else if (nilai < 1000) {
      simpanNilaiBagi = Math.floor(nilai / 100);
      temp =
        module.exports.terbilang_rupiah(simpanNilaiBagi) +
        " Ratus" +
        module.exports.terbilang_rupiah(nilai % 100);
    } else if (nilai < 2000) {
      temp = " Seribu" + module.exports.terbilang_rupiah(nilai - 1000);
    } else if (nilai < 1000000) {
      simpanNilaiBagi = Math.floor(nilai / 1000);
      temp =
        module.exports.terbilang_rupiah(simpanNilaiBagi) +
        " Ribu" +
        module.exports.terbilang_rupiah(nilai % 1000);
    } else if (nilai < 1000000000) {
      simpanNilaiBagi = Math.floor(nilai / 1000000);
      temp =
        module.exports.terbilang_rupiah(simpanNilaiBagi) +
        " Juta" +
        module.exports.terbilang_rupiah(nilai % 1000000);
    } else if (nilai < 1000000000000) {
      simpanNilaiBagi = Math.floor(nilai / 1000000000);
      temp =
        module.exports.terbilang_rupiah(simpanNilaiBagi) +
        " Miliar" +
        module.exports.terbilang_rupiah(nilai % 1000000000);
    } else if (nilai < 1000000000000000) {
      simpanNilaiBagi = Math.floor(nilai / 1000000000000);
      temp =
        module.exports.terbilang_rupiah(nilai / 1000000000000) +
        " Triliun" +
        module.exports.terbilang_rupiah(nilai % 1000000000000);
    }

    return `${temp}`;
  }, // Function to extract unique account codes
  extractUniqueAccountCodes: (data) => {
    const uniqueAccountCodes = new Set();
    data.data_payment.forEach((item) => {
      uniqueAccountCodes.add(item.account_code);
    });
    return Array.from(uniqueAccountCodes); // Convert set to array
  },
  generateDumpSQL: async () => {
    try {
      const dump = await mysqldump({
        connection: dbConfig,
        dumpToFile: "./backup_db.sql",
      });

      // const dumpData = await mysqldump(dumpOptions);
      // const dumpContent = typeof dumpData === 'string' ? dumpData : JSON.stringify(dumpData);

      // const dumpFilePath = './dump.sql'; // Adjust the file path as needed
      // await fs.promises.writeFile(dumpFilePath, dumpContent);
      // console.log('Dump file created:', dumpFilePath);
      return dump;
    } catch (error) {
      console.error("Error creating dump:", error);
      return null;
    }
  },
};
