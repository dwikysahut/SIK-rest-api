const connection = require("../config/db.config");

module.exports = {
  getMonthlyPaymentByStudent: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM detail_payment_rate_bulan INNER JOIN payment_rate ON payment_rate.payment_rate_id=detail_payment_rate_bulan.payment_rate_id WHERE payment_rate.student_student_id=?",
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
};
