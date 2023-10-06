const connection = require('../config/db.config');

module.exports = {
  getAllKelas: () => new Promise((resolve, reject) => {
    connection.query('SELECT kelas.*, program_studi.nama as nama_prodi FROM kelas INNER JOIN program_studi ON kelas.id_program_studi=program_studi.id_program_studi', (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  getKelasByProdi: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT kelas.*, program_studi.nama as nama_prodi FROM kelas INNER JOIN program_studi ON kelas.id_program_studi=program_studi.id_program_studi WHERE kelas.id_program_studi=?', id, (error, result) => {
      if (!error) {
        resolve(result);
      } else {
        reject(error);
      }
    });
  }),
  getKelasById: (id) => new Promise((resolve, reject) => {
    connection.query('SELECT * FROM kelas where id_kelas=?', id, (error, result) => {
      if (!error) {
        resolve(result[0]);
      } else {
        reject(error);
      }
    });
  }),
  postKelas: (setData) => new Promise((resolve, reject) => {
    connection.query('INSERT INTO kelas set ?', setData, (error, result) => {
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
  putKelas: (id, setData) => new Promise((resolve, reject) => {
    connection.query('UPDATE kelas set ? WHERE id_kelas=?', [setData, id], (error, result) => {
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
  deleteKelas: (id) => new Promise((resolve, reject) => {
    connection.query('DELETE FROM kelas WHERE id_kelas=?', id, (error, result) => {
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
