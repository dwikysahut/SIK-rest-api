const db = require('mysql');
const bluebird = require('bluebird');
require('dotenv').config();

const connection = db.createConnection({
  host: process.env.DB_HOST,
  user: 'root',
  password: '',
  database: 'db_kampus',
});

connection.connect((err) => {
  if (err) throw err;

  console.log('database connected');
});
connection.query = bluebird.promisify(connection.query);

module.exports = connection;
