const connection = require('../config/db.config');

module.exports = {
  getUserByUsername: (email) => new Promise((resolve, reject) => {
    connection.query('SELECT * from users where user_email=?', email, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(new Error(error));
      }
    });
  }),
  register: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO users set ?', setData, (error, result) => {
      if (!error) {
        const newResult = {
          id: result.insertId,
          ...setData,

        };
        delete newResult.password;
        resolve(newResult);
      } else {
        reject(new Error(error));
      }
    });
  }),

};
