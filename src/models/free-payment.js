const connection = require("../config/db.config");

module.exports = {
  getFreePaymentByStudent: (id, period_start = "", period_end = "") =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT detail_payment_rate_bebas.*,view_payment.* FROM detail_payment_rate_bebas INNER JOIN payment_rate ON payment_rate.payment_rate_id=detail_payment_rate_bebas.payment_rate_id INNER JOIN view_payment ON view_payment.payment_id=payment_rate.payment_payment_id  WHERE payment_rate.student_student_id=? AND period_start LIKE '%${period_start}%' AND period_end LIKE '%${period_end}%'`,
        id,
        (error, result) => {
          if (!error) {
            resolve(
              result.map((item) => ({
                ...item,
                payment_rate_discount: parseInt(item.payment_rate_discount, 10),
                payment_rate_total_pay: parseInt(
                  item.payment_rate_total_pay,
                  10
                ),
              }))
            );
          } else {
            reject(new Error(error));
          }
        }
      );
    }),
  getFreePaymentTypeByStudent: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM view_payment_type WHERE student_student_id=? AND payment_type='BEBAS'",
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
  getDetailFreePaymentTypeByIdPayment: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM detail_payment_rate_bebas_pay WHERE detail_payment_rate_id =?",
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
  getHistoryFreePaymentIdPayment: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT detail_payment_rate_bebas.*,detail_payment_rate_bebas_pay.* FROM detail_payment_rate_bebas INNER JOIN payment_rate ON payment_rate.payment_rate_id=detail_payment_rate_bebas.payment_rate_id INNER JOIN detail_payment_rate_bebas_pay ON detail_payment_rate_bebas_pay.detail_payment_rate_id=detail_payment_rate_bebas.detail_payment_rate_id WHERE payment_rate.student_student_id=? ",
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
  getTagihanFreePaymentIdPayment: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT detail_payment_rate_bebas.* FROM detail_payment_rate_bebas INNER JOIN payment_rate ON payment_rate.payment_rate_id=detail_payment_rate_bebas.payment_rate_id WHERE payment_rate.student_student_id=? ",
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
  getFreePaymentById: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM detail_payment_rate_bebas WHERE detail_payment_rate_id =?",
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
  getFreePaymentTypeByStudent: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM view_payment_type WHERE student_student_id=? AND payment_type='BEBAS'",
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
  putDiscountFreePaymentById: (setData, id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE detail_payment_rate_bebas set ? WHERE detail_payment_rate_id=?",
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

  putPaymentFreePayment: (setData, id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE detail_payment_rate_bebas set ? WHERE detail_payment_rate_id=?",
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
  postDetailFreePayment: (setData) =>
    new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO detail_payment_rate_bebas_pay set ? ",
        [setData],
        (error, result) => {
          if (!error) {
            const newData = {
              detail_payment_rate_id: parseInt(result.insertId, 10),
              ...result,
              field: { id: parseInt(result.insertId, 10) },
            };
            resolve(newData);
          } else {
            reject(error);
          }
        }
      );
    }),
};
