const connection = require('../config/db.config');

module.exports = {
  getAllPosPay: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM pos_pay order by account_account_code DESC', (error, result) => {
      if (!error) {
        return resolve(result);
      }
      return reject(error);
    });
  }),
  getPosPayById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM pos_pay where pos_pay_id=?', id, (error, result) => {
      if (!error) {
        return resolve(result[0]);
      }
      return reject(error);
    });
  }),
  getAccountCostByTypeAndId: (code) => new Promise((resolve, reject) => {
    connection.query(`SELECT * FROM account where account_code LIKE'%${code}%' order by account_code ASC`, [], (error, result) => {
      if (!error) {
        return resolve(result);
      }
      return reject(error);
    });
  }),
  postPosPay: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO pos_pay SET ?', setData, (error, result) => {
      if (!error) {
        const newData = {
          pos_pay_id: parseInt(result.insertId, 10),
          ...setData,
        };
        return resolve(newData);
      }
      return reject(error);
    });
  }),
  putPosPay: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE pos_pay SET ? where pos_pay_id=?', [setData, id], (error, result) => {
      if (!error) {
        const newData = {
          pos_pay_id: id,
          ...setData,
        };
        return resolve(newData);
      }
      return reject(error);
    });
  }),
  deleteAccountCost: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE from pos_pay where pos_pay_id=?', id, (error, result) => {
      if (!error) {
        const newData = {
          pos_pay_id: id,

        };
        return resolve(newData);
      }
      return reject(error);
    });
  }),
};
