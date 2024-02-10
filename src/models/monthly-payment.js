const connection = require("../config/db.config");

module.exports = {
  getMonthlyPaymentByStudent: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT detail_payment_rate_bulan.*,account.account_description as payment_rate_via_name,month.month_name FROM detail_payment_rate_bulan INNER JOIN payment_rate ON payment_rate.payment_rate_id=detail_payment_rate_bulan.payment_rate_id INNER JOIN month on month.month_id=detail_payment_rate_bulan.month_month_id LEFT JOIN account ON account.account_id=detail_payment_rate_bulan.payment_rate_via WHERE payment_rate.student_student_id=? order by month_id",
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error));
          }
        }
      );
    }),
  getMonthlyPaymentTypeByStudent: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM view_payment_type WHERE student_student_id=? AND payment_type='BULANAN'",
        id,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(new Error(error));
          }
        }
      );
    }),

  putMonthlyPayment: (id, setData) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE detail_payment_rate_bulan set ? WHERE detail_payment_rate_id=?",
        [setData, id],
        (error, result) => {
          if (!error) {
            const newData = {
              detail_payment_rate_id: parseInt(id, 10),
              ...result,
              field: { id: parseInt(id, 10), ...setData },
            };
            resolve(newData);
          } else {
            reject(error);
          }
        }
      );
    }),
  putMonthlyPaymentById: (setData, id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE detail_payment_rate_bulan set ? WHERE detail_payment_rate_id=?",
        [setData, id],
        (error, result) => {
          if (!error) {
            const newData = {
              detail_payment_rate_id: parseInt(id, 10),
              ...result,
              field: { id: parseInt(id, 10) },
            };
            resolve(newData);
          } else {
            reject(error);
          }
        }
      );
    }),
};
