const connection = require('../config/db.config');

module.exports = {
  getAllSiswa: () => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM view_siswa', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  getSiswaById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM view_siswa WHERE id_siswa=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(error);
      }
    });
  }),
  getAllSiswaByStatus: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM view_siswa WHERE id_status=?', id, (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  postSiswa: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO siswa set ?', setData, (error, result) => {
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
  putSiswa: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE siswa set ? WHERE id_siswa=?', [setData, id], (error, result) => {
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
  deletSiswa: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM siswa WHERE id_siswa=?', id, (error, result) => {
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
