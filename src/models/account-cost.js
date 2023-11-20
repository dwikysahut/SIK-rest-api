const connection = require('../config/db.config');

module.exports = {
  getAllAccountCost: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM account order by account_code ASC', (error, result) => {
      if (!error) {
        return resolve(result);
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
  postAccountCostByTypeAndId: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO account SET ?', setData, (error, result) => {
      if (!error) {
        const newData = {
          account_id: parseInt(result.insertId, 10),
          ...setData,
        };
        return resolve(newData);
      }
      return reject(error);
    });
  }),
  putAccountCostByTypeAndId: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE account SET ? where account_id=?', [setData, id], (error, result) => {
      if (!error) {
        const newData = {
          account_id: id,
          ...setData,
        };
        return resolve(newData);
      }
      return reject(error);
    });
  }),
};
