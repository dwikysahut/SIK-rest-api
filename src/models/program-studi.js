const connection = require('../config/db.config');

module.exports = {
  getAllProgramStudi: () => new Promise((resolve, reject) => {
    connection.query('SELECT * from program_studi', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  getProdiById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * from program_studi WHERE id_program_studi=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(error);
      }
    });
  }),
  postProgramStudi: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO program_studi set ?', setData, (error, result) => {
      if (!error) {
        const newData = {
          id: parseInt(result.insertId, 10),
          ...setData,
        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
  putProgramStudi: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE program_studi set ? WHERE id_program_studi=?', [setData, id], (error, result) => {
      if (!error) {
        const newData = {
          id: parseInt(id, 10),
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
    connection.query('DELETE FROM program_studi WHERE id_program_studi=?', id, (error, result) => {
      if (!error) {
        const newData = {
          id: parseInt(id, 10),
          ...result,
        };
        resolve(newData);
      } else {
        reject(error);
      }
    });
  }),
};
