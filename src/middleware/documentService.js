const puppeteer = require("puppeteer");

const path = require("path");
const fs = require("fs");
const { dateConvert, rupiahConvert } = require("../helpers");
const moment = require("moment");
const { tableHtmlRincianPembayaran } = require("../assets/htmlTemplate");
module.exports = {
  pdfGenerate: async function (htmlFile, opts = {}) {
    try {
      const {
        margin = {
          top: "0.4in",
          right: "0.4in",
          bottom: "0.4in",
          left: "0.4in",
        },
        format = "Letter",
      } = opts;
      // CREATE PDF USING PUPETEER
      const browser = await puppeteer.launch({
        args: ["--no-sandbox", "--disable-setuid-sandbox"],
      });
      const page = await browser.newPage();
      await page.setContent(htmlFile, { waitUntil: "domcontentloaded" });
      //   page = page.replace(/NAMA_BORROWER/g, borrower.nama_borrower);

      //   await page.emulateMedia("screen");
      const buffer = await page.pdf({
        printBackground: true,
        margin,
        format,
        preferCSSPageSize: true,
      });
      await browser.close();
      return buffer;
    } catch (err) {
      throw err;
    }
  },

  generateRincianPembayaran: async function (htmlFileUrl, datas) {
    console.log(datas);
    //baca file
    let html = fs.readFileSync(path.join(__dirname, htmlFileUrl), "utf-8");

    html = html.replace(
      "VALUE_TAHUN_AJARAN",
      `${datas.period_start}/${datas.period_end}`
    );
    html = html.replace(
      "VALUE_KELAS_SISWA",
      `${datas.majors_majors_name} - ${datas.class_class_name}`
    );
    html = html.replace("VALUE_NAMA_SISWA", datas.student_full_name);
    html = html.replace("VALUE_NIS_SISWA", datas.student_nis);
    html = html.replace(
      "VALUE_TANGGAL_DOKUMEN",
      `Depok, ${moment().locale("id").format("DD MMMM YYYY")}`
    );
    html = html.replace("VALUE_NIP", "");
    let tableRows = "";
    datas.data_payment.forEach((data, index) => {
      tableRows += tableHtmlRincianPembayaran(data, index, datas);
    });
    html = html.replace("VALUE_TABEL_PEMBAYARAN", tableRows);

    const buffer = await module.exports.pdfGenerate(html);
    return buffer;
  },
  generateTagihanPembayaran: async (htmlFileUrl, data) => {
    let html = fs.readFileSync(path.join(__dirname, htmlFileUrl), "utf-8");
    html = html.replace("VALUE_NIS_SISWA", data.student_full_name);
    html = html.replace("VALUE_NAMA_SISWA", data.period_name);
    html = html.replace("VALUE_KELAS_SISWA", data.class_name);
    html = html.replace(
      "VALUE_TAHUN_AJARAN",
      `${data.period_start}${data.period_end}`
    );

    html = html.replace("VALUE_TOTAL", data.student_nis);
    html = html.replace(
      "VALUE_TANGGAL_DOKUMEN",
      `Depok, ${moment().locale("id").format("DD MMMM YYYY")}`
    );
    html = html.replace("VALUE_NIP", "");

    const buffer = await module.exports.pdfGenerate(html);
    return buffer;
  },
};
