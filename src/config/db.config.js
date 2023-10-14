const db = require('mysql');
const bluebird = require('bluebird');
require('dotenv').config();

const connection = db.createConnection({
  host: process.env.DB_HOST,
  user: 'root',
  password: '',
  database: process.env.DB_NAME,
});

connection.connect((err) => {
  if (err) {
    throw new Error(err);
  }
  console.log('database connected');
});
connection.query = bluebird.promisify(connection.query);

module.exports = connection;
