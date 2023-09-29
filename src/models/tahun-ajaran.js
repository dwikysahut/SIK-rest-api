const connection = require('../config/db.config');

module.exports = {
  getAllTahunAjaran: () => new Promise((resolve, reject) => {
    connection.query('SELECT tahun_ajaran.* from tahun_ajaran', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),

  getTahunAjaranById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM tahun_ajaran where id_tahun_ajaran=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(error);
      }
    });
  }),
  postTahunAjaran: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO tahun_ajaran set ?', setData, (error, result) => {
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
  putTahunAjaran: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE tahun_ajaran set ? WHERE id_tahun_ajaran=?', [setData, id], (error, result) => {
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
  putTahunAjaranStatusNotIn: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE tahun_ajaran set ? WHERE id_tahun_ajaran<>?', [setData, id], (error, result) => {
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
  deleteTahunAjaran: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM tahun_ajaran WHERE id_tahun_ajaran=?', id, (error, result) => {
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
