const puppeteer = require("puppeteer");

const path = require("path");
const fs = require("fs");
module.exports = {
  pdfGenerate: async (htmlFile, opts = {}) => {
    try {
      const { format = "Letter" } = opts;
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
  generateRincianPembayaran: async ({ htmlFileUrl, data }) => {
    const html = fs.readFileSync(path.join(__dirname, htmlFileUrl), "utf-8");
    html = html.replace("VALUE_NAMA_SISWA", data.student_full_name);
    html = html.replace("VALUE_TAHUN_AJARAN", data.period_name);
    html = html.replace("VALUE_KELAS_SISWA", data.class_name);
    html = html.replace("VALUE_NIS_SISWA", data.student_nis);
    html = html.replace("VALUE_NO", data.student_nis);
    html = html.replace("VALUE_NAMA_PEMBAYARAN", data.student_nis);
    html = html.replace("VALUE_TANGGAL_BAYAR", data.payment_date);
    html = html.replace("VALUE_NOMINAL", data.payment_rate_bill);
    html = html.replace("VALUE_KETERANGAN", data.description);
    html = html.replace("VALUE_DIBAYAR_VIA", data.payment_via);
    const buffer = await pdfGenerate(html);
    return buffer;
  },
  generateTagihanPembayaran: async ({ htmlFileUrl, data }) => {
    const html = fs.readFileSync(path.join(__dirname, htmlFileUrl), "utf-8");
    html = html.replace("VALUE_NAMA_SISWA", data.student_full_name);
    html = html.replace("VALUE_TAHUN_AJARAN", data.period_name);
    html = html.replace("VALUE_KELAS_SISWA", data.class_name);
    html = html.replace("VALUE_NIS_SISWA", data.student_nis);
    html = html.replace("VALUE_NO", data.student_nis);
    html = html.replace("VALUE_NAMA_PEMBAYARAN", data.student_nis);
    html = html.replace("VALUE_TANGGAL_BAYAR", data.payment_date);
    html = html.replace("VALUE_NOMINAL", data.payment_rate_bill);
    html = html.replace("VALUE_KETERANGAN", data.description);
    html = html.replace("VALUE_DIBAYAR_VIA", data.payment_via);
    const buffer = await pdfGenerate(html);
    return buffer;
  },
};
