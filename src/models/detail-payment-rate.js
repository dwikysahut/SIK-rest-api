const connection = require('../config/db.config');

module.exports = {
  getAllDetailPaymentRateById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT detail_payment_rate.*, month.month_name from detail_payment_rate INNER JOIN month on detail_payment_rate.month_month_id=month.month_id where payment_rate_id=?', id, (err, result) => {
      if (!err) {
        resolve(result);
      }
      reject(err);
    });
  }),
  postDetailPaymentRate: (setData, query) => new Promise((resolve, reject) => {
    connection.query(query, setData, (error, result) => {
      if (!error) {
        const newData = {
          detail_payment_rate_id: parseInt(result.insertId, 10),
          ...setData,
        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
};
