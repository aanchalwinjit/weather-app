const mysql = require("mysql2");

const db = mysql.createConnection({
  host: '127.0.0.1',
  port: '3306',
  user: "root",
  password: 'Winjit@1234',
  database: "weather_db"
});

db.connect((err) => {
  if (err) throw err;
  console.log("MySQL connected.");
});

module.exports = db;
