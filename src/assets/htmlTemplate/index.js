const { dateConvert, rupiahConvert } = require("../../helpers");

module.exports = {
  tableHtmlRincianPembayaran: function (data, index, datas) {
    return `<tr>
        <td>${index + 1}</td>
        <td>${data.pos_pay_name} T.A ${datas.period_start}/${datas.period_end}${
      data.month_name
        ? `(${data.month_name} ${
            parseInt(data.month_month_id) - 6 <= 0
              ? `${datas.period_start}`
              : `${datas.period_end}`
          })`
        : " (bebas)"
    }</td>
        <td>${
          data.payment_rate_date_pay
            ? dateConvert(data.payment_rate_date_pay)
            : "-"
        }</td>
        <td>${rupiahConvert(
          data.payment_rate_status == 0
            ? data.payment_rate_total_pay || data.payment_rate_bill
            : "-"
        )}</td>
        <td>${data.payment_rate_status == 1 ? "Lunas" : "Belum Lunas"}</td>
        <td>${
          data.payment_type == "BULANAN"
            ? data.payment_rate_via_name || "-"
            : "-"
        }</td>
    </tr>`;
  },
  tableTagihanPembayaran: (data, index, datas) => `  <tr>
  <td>${index + 1}</td>
  <td>${data.pos_pay_name} T.A ${datas.period_start}/${datas.period_end}${
    data.month_name ? `(${data.month_name})` : " (bebas)"
  }</td>
  <td>${rupiahConvert(parseInt(data.payment_rate_bill, 10))}</td>

</tr>`,
  tableKwitansiPembayaran: (data, index, datas) => `  <tr>
  <td>${index + 1}</td>
  <td>${data.pos_pay_name} T.A ${data.period_start}/${data.period_end}${
    data.month_name ? `(${data.month_name})` : " (bebas)"
  }</td>
  <td>${rupiahConvert(
    parseInt(
      (data.month_month_id
        ? data.payment_rate_bill
        : data.payment_rate_bill - data.payment_rate_discount) ?? 0,
      10
    )
  )}</td>
  <td>${rupiahConvert(
    parseInt(
      (data.payment_rate_bebas_pay_bill || data.payment_rate_bill) ?? 0,
      10
    )
  )}</td>

</tr>`,
};
