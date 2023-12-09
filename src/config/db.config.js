const db = require('mysql2');
const bluebird = require('bluebird');
require('dotenv').config();

const connection = db.createConnection({
  host: process.env.DB_HOST,
  user: 'root',

  port: process.env.DB_PORT,
  // password: '123',
  database: process.env.DB_NAME,
});

connection.connect((err) => {
  if (err) throw err;

  console.log('database connected');
});
connection.query = bluebird.promisify(connection.query);

module.exports = connection;
