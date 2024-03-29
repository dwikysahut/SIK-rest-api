const connection = require("../config/db.config");

module.exports = {
  getAllKredit: (unitQuery = "") =>
    new Promise((resolve, reject) => {
      connection.query(
        `SELECT class.*, unit.unit_name as unit_unit_name from class INNER JOIN unit on unit.unit_id=class.unit_unit_id ${unitQuery}`,
        (error, result) => {
          if (!error) {
            resolve(result);
          } else {
            reject(error);
          }
        }
      );
    }),

  getKreditById: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM class where class_id=?",
        id,
        (error, result) => {
          if (!error) {
            resolve(result[0]);
          } else {
            reject(error);
          }
        }
      );
    }),
  postKredit: (setData) =>
    new Promise((resolve, reject) => {
      connection.query("INSERT INTO kredit set ?", setData, (error, result) => {
        if (!error) {
          const newData = {
            class_id: parseInt(result.insertId, 10),
            ...setData,
          };
          resolve(newData);
        } else {
          reject(error);
        }
      });
    }),
  putKredit: (id, setData) =>
    new Promise((resolve, reject) => {
      connection.query(
        "UPDATE kredit set ? WHERE kredit_id=?",
        [setData, id],
        (error, result) => {
          if (!error) {
            const newData = {
              kredit_id: parseInt(id, 10),
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
  deleteKredit: (id) =>
    new Promise((resolve, reject) => {
      connection.query(
        "DELETE FROM kredit WHERE kredit_id=?",
        id,
        (error, result) => {
          if (!error) {
            const newData = {
              kredit_id: parseInt(id, 10),
              ...result,
            };
            resolve(newData);
          } else {
            reject(error);
          }
        }
      );
    }),
};
