const connection = require('../config/db.config');

module.exports = {
  getAllProgramStudi: () => new Promise((resolve, reject) => {
    connection.query('SELECT * from majors', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  getProdiById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * from majors WHERE majors_id=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(error);
      }
    });
  }),
  postProgramStudi: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO majors set ?', setData, (error, result) => {
      if (!error) {
        const newData = {
          majors_id: parseInt(result.insertId, 10),
          ...setData,
        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
  putProgramStudi: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE majors set ? WHERE majors_id=?', [setData, id], (error, result) => {
      if (!error) {
        const newData = {
          majors_id: parseInt(id, 10),
          ...result,
          field: { id: parseInt(id, 10), ...setData },

        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
  deleteProgramStudi: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM majors WHERE majors_id=?', id, (error, result) => {
      if (!error) {
        const newData = {
          majors_id: parseInt(id, 10),
          ...result,
        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
};
