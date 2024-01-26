const connection = require("../config/db.config");

module.exports = {
  getPaymentTransactionByStudent: (id, { period_start, period_end }) =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT view_payment.*,view_payment_rate.* FROM view_payment INNER JOIN view_payment_rate ON view_payment.payment_id=view_payment_rate.payment_payment_id WHERE view_payment_rate.student_student_id=? AND (view_payment.period_start like '%${[
          period_start,
        ]}%' AND view_payment.period_end LIKE '%${period_end}%')`,
        id,
        (error, result) => {
          if (!error) {
            resolve(result[0]);
          } else {
            reject(new Error(error));
          }
        }
      );
    }),
};
